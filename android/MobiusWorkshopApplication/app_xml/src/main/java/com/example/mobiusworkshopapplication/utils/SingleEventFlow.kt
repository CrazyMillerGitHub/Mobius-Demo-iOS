package com.example.mobiusworkshopapplication.utils

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.FlowCollector
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.mapNotNull
import kotlinx.coroutines.flow.onEach

/**
 * Аналог [ru.yandex.eda.core.di.viewmodel.SingleLiveData] на [MutableStateFlow]
 *
 *  Особенности:
 * - Не работает с Nullable!
 * - Хранит "событие", пока не появится обработчик
 * - При существующем обработчике сразу доставляет событие
 * - Для полного соответствия добавил extension [call], который работает только с [Unit]
 *
 *  Как работает:
 *  1) Стандартно подписываемся на события (как c обычным Flow)
 *  2) Отправляем событие на обработку вызовом [emit], либо [call] (только для [Unit])
 *
 * ```
 * class ViewModel {
 *     val eventFlow = SingleEventFlow<String>()
 *
 *     fun triggerEvent() {
 *         eventFlow.emit("some string value")
 *     }
 * }
 *
 * class Fragment() {
 *     fun initObservers() {
 *         viewModel.eventFlow
 *             .launchAndCollectOn(viewLifecycleOwner) { someStringValue ->
 *                 triggerSomeEventWithStringValue(someStringValue)
 *             }
 *     }
 * }
 * ```
 */
class SingleEventFlow<T> : Flow<T> {

    private val eventHolder: MutableStateFlow<T?> = MutableStateFlow(null)

    /**
     * Реализуем стандартный коллектор под наши нужды
     */
    override suspend fun collect(collector: FlowCollector<T>) {
        asFlow().collect(collector)
    }

    /**
     * Отправляем событие на обработку
     *
     * @param value новое событие
     */
    fun emit(value: T) {
        eventHolder.value = value
    }

    /**
     * Конвертируем источник событий:
     * 1) фильтруем nullable
     * 2) обнуляем value при получении события обработчиком
     *
     * @return источник NonNullable событий
     */
    private fun asFlow(): Flow<T> = eventHolder
        .mapNotNull { it } // подписчики получают только NonNullable события
        .onEach { eventHolder.value = null } // "помечаем", что событие обработано
}
