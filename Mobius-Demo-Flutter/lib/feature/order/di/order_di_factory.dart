import 'package:mobius_demo_flutter/feature/order/data/data.dart';
import 'package:mobius_demo_flutter/feature/order/domain/domain.dart';
import 'package:mobius_demo_flutter/feature/order/widget/model/model.dart';

import 'order_di.dart';

class OrderDiFactory {
  const OrderDiFactory();

  CommonOrderDiImpl createCommon() {
    const repository = OrderRepositoryImpl(
      orderDB: MockOrderDB(),
    );
    final stateManager = OrderTabStateManager();
    final widgetModel = CommonOrderWidgetModelImpl(
      stateManager: stateManager,
    );
    return CommonOrderDiImpl(
      repository: repository,
      stateManager: stateManager,
      widgetModel: widgetModel,
    );
  }

  MarketOrderDiImpl createMarket(CommonOrderDi di) {
    final stateManager = MarketOrderStateManager(
      orderUseCase: MarketOrderStateUseCase(
        repository: di.repository,
      ),
    );
    final widgetModel = MarketWidgetModel(
      stateManager: stateManager,
    );

    return MarketOrderDiImpl(
      stateManager: stateManager,
      widgetModel: widgetModel,
    );
  }

  RestaurantOrderDiImpl createRestaurant(CommonOrderDi di) {
    final stateManager = RestaurantOrderStateManager(
      orderUseCase: RestaurantOrderStateUseCase(
        repository: di.repository,
      ),
    );
    final widgetModel = RestaurantWidgetModel(
      stateManager: stateManager,
    );

    return RestaurantOrderDiImpl(
      stateManager: stateManager,
      widgetModel: widgetModel,
    );
  }
}
