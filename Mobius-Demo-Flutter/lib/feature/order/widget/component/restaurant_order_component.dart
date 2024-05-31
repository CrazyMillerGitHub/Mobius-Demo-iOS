import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/order/domain/domain.dart';

class RestaurantOrderComponent extends StatelessWidget {
  final RestaurantOrder order;

  const RestaurantOrderComponent(this.order, {super.key});

  @override
  Widget build(BuildContext context) => const ColoredBox(
        color: Colors.white,
        child: SizedBox(
          height: 250,
          child: Center(child: Text('Restaurant')),
        ),
      );
}
