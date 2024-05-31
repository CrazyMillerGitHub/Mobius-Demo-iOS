import 'package:meta/meta.dart';
import 'package:mobius_demo_flutter/feature/order/domain/domain.dart';

abstract interface class CommonOrderWidgetModel {
  void setMarket();
  void setRestaurant();
}

abstract interface class OrderWidgetModel {
  void read();
}

@immutable
final class CommonOrderWidgetModelImpl implements CommonOrderWidgetModel {
  final OrderTabStateManager _stateManager;

  const CommonOrderWidgetModelImpl({
    required OrderTabStateManager stateManager,
  }) : _stateManager = stateManager;

  @override
  void setMarket() => _stateManager.setActiveTab(OrderTab.market);

  @override
  void setRestaurant() => _stateManager.setActiveTab(OrderTab.restaurant);
}

@immutable
abstract base class BaseWidgetModel implements OrderWidgetModel {
  final OrderStateManager _stateManager;

  const BaseWidgetModel({
    required OrderStateManager stateManager,
  }) : _stateManager = stateManager;

  @override
  void read() => _stateManager.readOrders();
}

@immutable
final class MarketWidgetModel extends BaseWidgetModel {
  const MarketWidgetModel({required super.stateManager});
}

@immutable
final class RestaurantWidgetModel extends BaseWidgetModel {
  const RestaurantWidgetModel({required super.stateManager});
}
