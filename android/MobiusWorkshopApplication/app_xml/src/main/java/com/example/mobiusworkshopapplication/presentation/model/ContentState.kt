package com.example.mobiusworkshopapplication.presentation.model

import com.example.mobiusworkshopapplication.data.OrderList

sealed interface ContentState {
    data object Loading : ContentState

    data class Content(
        val orderList: OrderList
    ) : ContentState
}
