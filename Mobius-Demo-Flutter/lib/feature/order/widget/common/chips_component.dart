import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ChipsComponent extends StatelessWidget {
  final List<OrderTab> tabs;
  final OrderTab active;
  final ValueChanged<OrderTab> onTap;

  const ChipsComponent({
    required this.tabs,
    required this.active,
    required this.onTap,
    super.key,
  });

  static const double height = 42;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Colors.white,
        child: SizedBox(
          height: height,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final tab = tabs[index];
              return ChipComponent(
                label: tab.label,
                onTap: () => onTap(tab),
                isSelected: tab == active,
              );
            },
            separatorBuilder: (context, int index) => const SizedBox(width: 16),
            itemCount: tabs.length,
          ),
        ),
      );
}

class ChipComponent extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ChipComponent({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  static const Color selectedBackgroundColor = Color(0xFF42413E);
  static const Color deselectedBackgroundColor = Color(0xFFF2F1EE);
  static const Color selectedForegroundColor = Colors.white;
  static const Color deselectedForegroundColor = Colors.black;
  static const double cornerRadius = 20;

  @override
  Widget build(BuildContext context) => RawChip(
        onPressed: onTap,
        label: Text(label),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            cornerRadius,
          ),
        ),
        side: BorderSide.none,
        selected: isSelected,
        showCheckmark: false,
        selectedColor: selectedBackgroundColor,
        backgroundColor: deselectedBackgroundColor,
        elevation: 0.0,
        labelStyle: TextStyle(height: 1, color: _foreground),
      );

  Color get _foreground =>
      isSelected ? selectedForegroundColor : deselectedForegroundColor;
}
