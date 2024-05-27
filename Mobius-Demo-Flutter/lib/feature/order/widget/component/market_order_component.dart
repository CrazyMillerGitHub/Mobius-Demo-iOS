import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/order/domain/domain.dart';

class MarketOrderComponent extends StatelessWidget {
  final MarketOrder order;

  const MarketOrderComponent(this.order, {super.key});

  @override
  Widget build(BuildContext context) => const ColoredBox(
        color: Colors.white,
        child: SizedBox(
          height: 250,
          child: Center(child: Text('Market')),
        ),
      );
}
