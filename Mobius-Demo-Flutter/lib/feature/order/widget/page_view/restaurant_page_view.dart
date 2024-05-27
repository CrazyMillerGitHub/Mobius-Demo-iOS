import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/order/widget/orders_scope.dart';

import '../../domain/domain.dart';
import '../common/order_items_list_builder.dart';
import '../component/restaurant_order_component.dart';

class RestaurantPageView extends StatelessWidget {
  const RestaurantPageView({super.key});

  @override
  Widget build(BuildContext context) => RestaurantOrderScope(
        child: Builder(builder: (context) {
          return OrderItemsListBuilder<RestaurantOrder>(
            stateManager: RestaurantOrderScope.stateManagerOf(context),
            widgetModel: RestaurantOrderScope.widgetModelOf(context),
            builder: (context, value) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: RestaurantOrderComponent(value),
            ),
          );
        }),
      );
}
