package com.example.mobiusworkshopapplication

import android.os.Bundle
import android.view.View
import androidx.activity.ComponentActivity
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.runtime.getValue
import androidx.core.content.res.ResourcesCompat
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.lifecycleScope
import com.example.mobiusworkshopapplication.databinding.MainContentBinding
import com.example.mobiusworkshopapplication.presentation.ViewModel
import com.example.mobiusworkshopapplication.presentation.model.ContentState
import com.example.mobiusworkshopapplication.presentation.model.StateEvent
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.launch

class MainActivity : ComponentActivity() {
    private lateinit var binding: MainContentBinding

    private var selectedChipPosition = 0

    private val viewModel by lazy {
        ViewModelProvider(this)[ViewModel::class.java]
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = DataBindingUtil.setContentView(this, R.layout.main_content)
    }

    override fun onStart() {
        super.onStart()
        lifecycleScope.launch {
            viewModel.state.collect { state ->
                handleState(state)
            }
        }
        configureChips()
        configureChipsClicks()
    }

    private fun handleState(state: ContentState) {
        when(state) {
            is ContentState.Content -> setLoading(false)
            ContentState.Loading -> setLoading(true)
        }
    }

    private fun configureChipsClicks() {
        binding.marketChip.setOnClickListener {
            selectedChipPosition = 0
            viewModel.onEvent(StateEvent.MarketSelected)
            configureChips()
        }
        binding.restaurantChip.setOnClickListener {
            selectedChipPosition = 1
            viewModel.onEvent(StateEvent.RestaurantsSelected)
            configureChips()
        }
    }

    private fun configureChips() {
        binding.marketChip.apply {
            background = ResourcesCompat.getDrawable(
                context.resources,
                if (selectedChipPosition == 0) R.drawable.chip_selected_shape else R.drawable.chip_unselected_shape,
                null
            )
            setTextColor(
                resources.getColor(
                    if (selectedChipPosition == 0) R.color.white else R.color.black,
                    null
                )
            )
        }
        binding.restaurantChip.apply {
            background = ResourcesCompat.getDrawable(
                context.resources,
                if (selectedChipPosition == 1) R.drawable.chip_selected_shape else R.drawable.chip_unselected_shape,
                null
            )
            setTextColor(
                resources.getColor(
                    if (selectedChipPosition == 1) R.color.white else R.color.black,
                    null
                )
            )
        }
    }

    private fun setLoading(isLoading: Boolean) {
        binding.apply {
            loader.visibility = if (isLoading) View.VISIBLE else View.GONE
            chipSection.visibility = if (!isLoading) View.VISIBLE else View.GONE
            scroll.visibility = if (!isLoading) View.VISIBLE else View.GONE
        }
    }
}
