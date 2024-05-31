package com.example.mobiusworkshopapplication.presentation.model


internal sealed interface StateEvent {
    data object MarketSelected: StateEvent
    data object RestaurantsSelected: StateEvent
}