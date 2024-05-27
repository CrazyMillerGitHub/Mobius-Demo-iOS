import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/order/widget/orders_scope.dart';
import 'package:mobius_demo_flutter/feature/order/widget/page_view/page_view.dart';

import '../domain/domain.dart';
import 'common/chips_component.dart';
import 'component/split_component.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static const String path = '/orders';

  @override
  Widget build(BuildContext context) => OrdersScope(
        child: Scaffold(
          appBar: const _AppBarLayout(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverToBoxAdapter(child: SplitComponent()),
            ],
            body: const _OrdersListLayout(),
          ),
        ),
      );
}

class _AppBarLayout extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarLayout({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(44 + ChipsComponent.height);

  @override
  Widget build(BuildContext context) => AppBar(
        toolbarHeight: preferredSize.height,
        title: const Text(
          'Мои заказы',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(ChipsComponent.height),
          child: _ChipTabs(),
        ),
      );
}

class _ChipTabs extends StatelessWidget {
  const _ChipTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManager = OrdersScope.tabManagerOf(context);
    final wm = OrdersScope.widgetModelOf(context);
    return ListenableBuilder(
      listenable: stateManager,
      builder: (context, _) => ChipsComponent(
        tabs: OrderTab.values,
        active: stateManager.state,
        onTap: (tab) => switch (tab) {
          OrderTab.market => wm.setMarket(),
          OrderTab.restaurant => wm.setRestaurant(),
        },
      ),
    );
  }
}

class _OrdersListLayout extends StatelessWidget {
  const _OrdersListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManager = OrdersScope.tabManagerOf(context);
    return ListenableBuilder(
      listenable: stateManager,
      builder: (context, _) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: switch (stateManager.state) {
          OrderTab.market => const MarketPageView(),
          OrderTab.restaurant => const RestaurantPageView(),
        },
      ),
    );
  }
}
