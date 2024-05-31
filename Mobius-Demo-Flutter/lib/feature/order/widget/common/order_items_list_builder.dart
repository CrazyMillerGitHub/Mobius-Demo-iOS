import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/order/domain/domain.dart';
import 'package:mobius_demo_flutter/feature/order/domain/state_manager/order_state_manager.dart';
import 'package:mobius_demo_flutter/feature/order/domain/state_manager/state_manager.dart';

import '../model/model.dart';
import 'progress_component.dart';

typedef ValueBuilder<T> = Widget Function(BuildContext context, T value);

class OrderItemsListBuilder<T> extends StatefulWidget {
  final OrderStateManager<T> stateManager;
  final OrderWidgetModel widgetModel;
  final ValueBuilder<T> builder;

  const OrderItemsListBuilder({
    super.key,
    required this.stateManager,
    required this.widgetModel,
    required this.builder,
  });

  @override
  State<OrderItemsListBuilder<T>> createState() =>
      _OrderItemsListBuilderState<T>();
}

class _OrderItemsListBuilderState<T> extends State<OrderItemsListBuilder<T>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      widget.widgetModel.read();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateManager = widget.stateManager;
    return ListenableBuilder(
      listenable: stateManager,
      builder: (context, _) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: switch (stateManager.state) {
          ProgressOrderState() => _ProgressLayout(
              key: ValueKey(stateManager.state),
            ),
          ErrorOrderState(message: String text) => _ErrorLayout(
              key: ValueKey(stateManager.state),
              message: text,
            ),
          SuccessOrderState(items: List<T> items) => _ItemsLayout<T>(
              key: ValueKey(stateManager.state),
              items: items,
              builder: widget.builder,
            ),
        },
      ),
    );
  }
}

class _ProgressLayout extends StatelessWidget {
  const _ProgressLayout({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: EdgeInsets.only(
          top: 4.0 + MediaQuery.paddingOf(context).top,
          bottom: 4.0 + MediaQuery.paddingOf(context).bottom,
          left: MediaQuery.paddingOf(context).left,
          right: MediaQuery.paddingOf(context).right,
        ),
        itemBuilder: (context, index) => const ProgressComponent(),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 5,
      );
}

class _ErrorLayout extends StatelessWidget {
  final String message;

  const _ErrorLayout({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(child: Text(message));
}

class _ItemsLayout<T> extends StatelessWidget {
  final List<T> items;
  final ValueBuilder<T> builder;

  const _ItemsLayout({
    required this.items,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: EdgeInsets.only(
          top: 4.0 + MediaQuery.paddingOf(context).top,
          bottom: 4.0 + MediaQuery.paddingOf(context).bottom,
          left: MediaQuery.paddingOf(context).left,
          right: MediaQuery.paddingOf(context).right,
        ),
        itemBuilder: (context, index) => builder(context, items[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: items.length,
      );
}
