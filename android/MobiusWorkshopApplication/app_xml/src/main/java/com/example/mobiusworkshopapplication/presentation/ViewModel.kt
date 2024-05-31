package com.example.mobiusworkshopapplication.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.mobiusworkshopapplication.presentation.model.ContentState
import com.example.mobiusworkshopapplication.presentation.model.StateEvent
import com.example.mobiusworkshopapplication.presentation.model.marketMock
import com.example.mobiusworkshopapplication.presentation.model.restaurantMock
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

internal class ViewModel : ViewModel() {
    private val _state = MutableStateFlow<ContentState>(ContentState.Loading)

    init {
        viewModelScope.launch {
            loadData(isMarket = true)
        }
    }

    val state: StateFlow<ContentState>
        get() = _state

    fun onEvent(event: StateEvent) {
        viewModelScope.launch {
            when (event) {
                StateEvent.MarketSelected -> loadData(isMarket = true)
                StateEvent.RestaurantsSelected -> loadData(isMarket = false)
            }
        }
    }

    private fun loadData(isMarket: Boolean) {
        viewModelScope.launch {
            _state.update { ContentState.Loading }
            delay(3000)
            _state.update {
                ContentState.Content(
                    orderList = if (isMarket) marketMock else restaurantMock
                )
            }
        }
    }
}
