package com.example.mobiusworkshopapplication.presentation.model


sealed interface AddressPresentationModel {
    data object Loading: AddressPresentationModel

    data class Content(
        val title: String,
        val subtitle: String,
        val iconUrl: String,
        val deeplink: String
    ): AddressPresentationModel
}