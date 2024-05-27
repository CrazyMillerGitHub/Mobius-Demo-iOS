import 'package:flutter/material.dart';

class AppMaterialContext extends StatelessWidget {
  final Widget child;

  const AppMaterialContext({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF5F4F2)),
        scaffoldBackgroundColor: const Color(0xFFF5F4F2),
      ),
      home: child,
    );
  }
}
