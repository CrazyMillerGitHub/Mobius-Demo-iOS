import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/order/widget/component/market_order_component.dart';
import 'package:mobius_demo_flutter/feature/order/widget/orders_scope.dart';

import '../../domain/domain.dart';
import '../common/order_items_list_builder.dart';

class MarketPageView extends StatelessWidget {
  const MarketPageView({super.key});

  @override
  Widget build(BuildContext context) => MarketOrderScope(
        child: Builder(builder: (context) {
          return OrderItemsListBuilder<MarketOrder>(
            stateManager: MarketOrderScope.stateManagerOf(context),
            widgetModel: MarketOrderScope.widgetModelOf(context),
            builder: (context, value) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: MarketOrderComponent(value),
            ),
          );
        }),
      );
}
