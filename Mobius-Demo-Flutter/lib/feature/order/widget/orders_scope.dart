import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/order/domain/state_manager/state_manager.dart';
import 'package:provider/provider.dart';

import '../di/di.dart';
import 'model/model.dart';

class OrdersScope extends StatelessWidget {
  final Widget child;

  const OrdersScope({
    required this.child,
    super.key,
  });

  static CommonOrderDi containerOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<CommonOrderDiImpl>(
        context,
        listen: listen,
      );

  static OrderTabStateManager tabManagerOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      containerOf(context, listen: listen).stateManager;

  static CommonOrderWidgetModel widgetModelOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      containerOf(context, listen: listen).widgetModel;

  @override
  Widget build(BuildContext context) => Provider<CommonOrderDiImpl>(
        create: (BuildContext context) => const OrderDiFactory().createCommon(),
        child: child,
      );
}

class MarketOrderScope extends StatelessWidget {
  final Widget child;

  const MarketOrderScope({
    required this.child,
    super.key,
  });

  static MarketOrderDi containerOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<MarketOrderDiImpl>(
        context,
        listen: listen,
      );

  static MarketOrderStateManager stateManagerOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      containerOf(context, listen: listen).stateManager;

  static MarketWidgetModel widgetModelOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      containerOf(context, listen: listen).widgetModel;

  @override
  Widget build(BuildContext context) => Provider<MarketOrderDiImpl>(
        create: (BuildContext context) {
          final di = OrdersScope.containerOf(context, listen: false);
          return const OrderDiFactory().createMarket(di);
        },
        child: child,
      );
}

class RestaurantOrderScope extends StatelessWidget {
  final Widget child;

  const RestaurantOrderScope({
    required this.child,
    super.key,
  });

  static RestaurantOrderDi containerOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<RestaurantOrderDiImpl>(
        context,
        listen: listen,
      );

  static RestaurantOrderStateManager stateManagerOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      containerOf(context, listen: listen).stateManager;

  static RestaurantWidgetModel widgetModelOf(
    BuildContext context, {
    bool listen = true,
  }) =>
      containerOf(context, listen: listen).widgetModel;

  @override
  Widget build(BuildContext context) => Provider<RestaurantOrderDiImpl>(
        create: (BuildContext context) {
          final di = OrdersScope.containerOf(context, listen: false);
          return const OrderDiFactory().createRestaurant(di);
        },
        child: child,
      );
}
