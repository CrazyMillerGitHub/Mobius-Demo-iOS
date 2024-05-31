package com.example.mobiusworkshopapplication.data

data class OrderList(
    val orders: List<Order>
)

data class Order(
    val currency: String,
    val currentStatus: String,
    val deliveryDate: String,
    val items: List<Item>,
    val orderId: String,
    val source: String?,
    val totalPrice: Double
)

data class Item(
    val currency: String,
    val imageUrl: String,
    val itemId: String,
    val name: String,
    val pricePerUnit: Double,
    val quantity: Int
)
