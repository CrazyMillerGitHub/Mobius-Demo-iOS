import 'package:flutter/material.dart';

class ProgressComponent extends StatelessWidget {
  const ProgressComponent({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const SizedBox(height: 56),
      );
}
