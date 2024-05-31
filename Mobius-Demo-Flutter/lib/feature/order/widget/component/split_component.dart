import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/util/constants.dart';

class SplitComponent extends StatelessWidget {
  const SplitComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Constants.secondaryApp),
        child: Center(child: Text('Split')),
      ),
    );
  }
}
