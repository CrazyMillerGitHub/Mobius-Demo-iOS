import 'package:flutter/material.dart';
import 'package:mobius_demo_flutter/feature/app/widget/app_material_context.dart';
import 'package:mobius_demo_flutter/feature/feature.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const AppMaterialContext(
        child: OrdersScreen(),
      );
}
