import 'package:meta/meta.dart';
import 'package:mobius_demo_flutter/feature/order/domain/repository/order_repository.dart';

import '../entity/entity.dart';

abstract interface class OrderStateUseCase<T> {
  Future<List<T>> read();
}

@immutable
abstract base class BaseOrderStateUseCase<T> implements OrderStateUseCase<T> {
  @protected
  final OrderRepository repository;

  const BaseOrderStateUseCase({required this.repository});
}

@immutable
final class MarketOrderStateUseCase extends BaseOrderStateUseCase<MarketOrder> {
  const MarketOrderStateUseCase({required super.repository});

  @override
  Future<List<MarketOrder>> read() => repository.readMarketOrders();
}

@immutable
final class RestaurantOrderStateUseCase
    extends BaseOrderStateUseCase<RestaurantOrder> {
  const RestaurantOrderStateUseCase({required super.repository});

  @override
  Future<List<RestaurantOrder>> read() => repository.readRestaurantOrders();
}
