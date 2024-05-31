package com.example.mobiusworkshopapplication

import android.os.Bundle
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.lifecycleScope
import com.example.mobiusworkshopapplication.presentation.Content
import com.example.mobiusworkshopapplication.presentation.ViewModel

class MainActivity : ComponentActivity() {
    private val viewModel by lazy {
        ViewModelProvider(this)[ViewModel::class.java]
    }

    @ExperimentalMaterial3Api
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            val state by viewModel.state.collectAsState()
            Content(
                state = state,
                onEvent = viewModel::onEvent
            )
        }
    }
}
