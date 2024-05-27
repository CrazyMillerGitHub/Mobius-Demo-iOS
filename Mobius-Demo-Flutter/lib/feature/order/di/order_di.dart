import 'package:meta/meta.dart';

import '../domain/repository/repository.dart';
import '../domain/state_manager/state_manager.dart';
import '../widget/model/model.dart';

abstract interface class CommonOrderDi {
  abstract final OrderRepository repository;
  abstract final OrderTabStateManager stateManager;
  abstract final CommonOrderWidgetModel widgetModel;
}

abstract interface class OrderDi {
  abstract final OrderStateManager stateManager;
  abstract final OrderWidgetModel widgetModel;
}

abstract interface class MarketOrderDi implements OrderDi {
  @override
  abstract final MarketOrderStateManager stateManager;

  @override
  abstract final MarketWidgetModel widgetModel;
}

abstract interface class RestaurantOrderDi implements OrderDi {
  @override
  abstract final RestaurantOrderStateManager stateManager;

  @override
  abstract final RestaurantWidgetModel widgetModel;
}

@immutable
final class CommonOrderDiImpl implements CommonOrderDi {
  @override
  final OrderRepository repository;

  @override
  final OrderTabStateManager stateManager;

  @override
  final CommonOrderWidgetModel widgetModel;

  const CommonOrderDiImpl({
    required this.repository,
    required this.stateManager,
    required this.widgetModel,
  });
}

@immutable
final class MarketOrderDiImpl implements MarketOrderDi {
  @override
  final MarketOrderStateManager stateManager;

  @override
  final MarketWidgetModel widgetModel;

  const MarketOrderDiImpl({
    required this.stateManager,
    required this.widgetModel,
  });
}

@immutable
final class RestaurantOrderDiImpl implements RestaurantOrderDi {
  @override
  final RestaurantOrderStateManager stateManager;

  @override
  final RestaurantWidgetModel widgetModel;

  const RestaurantOrderDiImpl({
    required this.stateManager,
    required this.widgetModel,
  });
}
