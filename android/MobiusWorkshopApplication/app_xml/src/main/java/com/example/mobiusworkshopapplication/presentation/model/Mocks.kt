package com.example.mobiusworkshopapplication.presentation.model

import com.example.mobiusworkshopapplication.data.Item
import com.example.mobiusworkshopapplication.data.Order
import com.example.mobiusworkshopapplication.data.OrderList

val addressListTitle: String
    get() = "Адреса"

val noInternetError: String
    get() = "Не вышло загрузить. Проверьте соединение и попробуйте ещё раз"

val bannerUrl: String
    get() = "https://avatars.mds.yandex.net/get-eda-images/9706557/20ba49bb-b5fd-11ee-9e62-12f9d1d13fc9/orig"

val marketMock = OrderList(
    orders = listOf(
        Order(
            orderId = "123456",
            deliveryDate = "2023-11-05",
            items = listOf(
                Item(
                    itemId = "ITM78910",
                    name = "Беспроводная мышь",
                    quantity = 1,
                    pricePerUnit = 25.99,
                    currency = "USD",
                    imageUrl = "images/wireless_mouse.jpg"
                ),
                Item(
                    itemId = "ITM78911",
                    name = "Клавиатура",
                    quantity = 1,
                    pricePerUnit = 49.99,
                    currency = "USD",
                    imageUrl = "images/keyboard.jpg"
                )
            ),
            totalPrice = 75.98,
            currency = "USD",
            currentStatus = "delivered",
            source = null
        ),
        Order(
            orderId = "123457",
            deliveryDate = "2023-11-07",
            items = listOf(
                Item(
                    itemId = "ITM78912",
                    name = "Подставка для ноутбука",
                    quantity = 1,
                    pricePerUnit = 39.99,
                    currency = "USD",
                    imageUrl = "images/laptop_stand.jpg"
                ),
                Item(
                    itemId = "ITM78913",
                    name = "USB-C Хаб",
                    quantity = 1,
                    pricePerUnit = 29.99,
                    currency = "USD",
                    imageUrl = "images/usb_c_hub.jpg"
                ),
                Item(
                    itemId = "ITM78914",
                    name = "Внешний жесткий диск",
                    quantity = 1,
                    pricePerUnit = 119.99,
                    currency = "USD",
                    imageUrl = "images/external_hard_drive.jpg"
                )
            ),
            totalPrice = 189.97,
            currency = "USD",
            currentStatus = "not_delivered",
            source = null
        ),
        Order(
            orderId = "123458",
            deliveryDate = "2023-11-10",
            items = listOf(
                Item(
                    itemId = "ITM78915",
                    name = "Монитор",
                    quantity = 2,
                    pricePerUnit = 199.99,
                    currency = "USD",
                    imageUrl = "images/monitor.jpg"
                )
            ),
            totalPrice = 399.98,
            currency = "USD",
            currentStatus = "not_delivered",
            source = null
        )
    )
)

val restaurantMock = OrderList(
    orders = listOf(
        Order(
            orderId = "123456",
            deliveryDate = "2023-11-05",
            items = listOf(
                Item(
                    itemId = "ITM78910",
                    name = "Бургер",
                    quantity = 1,
                    pricePerUnit = 450.0,
                    currency = "RUB",
                    imageUrl = "images/burger.jpg"
                ),
                Item(
                    itemId = "ITM78911",
                    name = "Картофель фри",
                    quantity = 1,
                    pricePerUnit = 230.0,
                    currency = "RUB",
                    imageUrl = "images/fries.jpg"
                )
            ),
            totalPrice = 680.0,
            currency = "RUB",
            currentStatus = "delivered",
            source = "Яндекс Еда"
        ),
        Order(
            orderId = "123457",
            deliveryDate = "2023-11-07",
            items = listOf(
                Item(
                    itemId = "ITM78912",
                    name = "Маргарита Пицца",
                    quantity = 1,
                    pricePerUnit = 980.0,
                    currency = "RUB",
                    imageUrl = "images/margherita_pizza.jpg"
                ),
                Item(
                    itemId = "ITM78913",
                    name = "Цезарь салат",
                    quantity = 1,
                    pricePerUnit = 680.0,
                    currency = "RUB",
                    imageUrl = "images/caesar_salad.jpg"
                ),
                Item(
                    itemId = "ITM78914",
                    name = "Тирамису",
                    quantity = 1,
                    pricePerUnit = 530.0,
                    currency = "RUB",
                    imageUrl = "images/tiramisu.jpg"
                )
            ),
            totalPrice = 2190.0,
            currency = "RUB",
            currentStatus = "cooking",
            source = "Яндекс Лавка"
        ),
        Order(
            orderId = "123458",
            deliveryDate = "2023-11-10",
            items = listOf(
                Item(
                    itemId = "ITM78915",
                    name = "Том Ям Суп",
                    quantity = 2,
                    pricePerUnit = 820.0,
                    currency = "RUB",
                    imageUrl = "images/tom_yum_soup.jpg"
                )
            ),
            totalPrice = 1640.0,
            currency = "RUB",
            currentStatus = "delivering",
            source = "Яндекс Еда"
        )
    )
)