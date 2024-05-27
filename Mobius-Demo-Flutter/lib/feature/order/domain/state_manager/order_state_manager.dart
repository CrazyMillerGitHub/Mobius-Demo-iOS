import 'package:flutter/foundation.dart';

import '../entity/entity.dart';
import 'order_state_use_case.dart';

sealed class OrderState<T> {
  bool get isProgress => switch (this) {
        ProgressOrderState<T>() => true,
        _ => false,
      };

  bool get isError => switch (this) {
        ErrorOrderState<T>() => true,
        _ => false,
      };

  bool get isSuccess => switch (this) {
        SuccessOrderState<T>() => true,
        _ => false,
      };

  const OrderState();
}

final class ProgressOrderState<T> extends OrderState<T> {
  const ProgressOrderState();
}

final class ErrorOrderState<T> extends OrderState<T> {
  final String message;

  const ErrorOrderState({required this.message});
}

final class SuccessOrderState<T> extends OrderState<T> {
  final List<T> items;

  const SuccessOrderState({required this.items});
}

class OrderStateManager<T> extends ChangeNotifier {
  final OrderStateUseCase<T> _orderUseCase;

  OrderState<T> _state;

  @protected
  set state(OrderState<T> value) {
    if (_state == value) {
      return;
    }

    _state = value;
    notifyListeners();
  }

  OrderState<T> get state => _state;

  OrderStateManager({
    required OrderStateUseCase<T> orderUseCase,
  })  : _orderUseCase = orderUseCase,
        _state = const ProgressOrderState();

  Future<void> readOrders() async {
    try {
      state = const ProgressOrderState();
      final items = await _orderUseCase.read();
      state = SuccessOrderState(items: items);
    } on Object catch (error, _) {
      state = ErrorOrderState(message: error.toString());
      rethrow;
    }
  }
}

final class MarketOrderStateManager extends OrderStateManager<MarketOrder> {
  MarketOrderStateManager({required super.orderUseCase});
}

final class RestaurantOrderStateManager
    extends OrderStateManager<RestaurantOrder> {
  RestaurantOrderStateManager({required super.orderUseCase});
}
