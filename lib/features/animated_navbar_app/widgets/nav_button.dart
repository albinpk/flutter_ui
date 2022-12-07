import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.index,
    required this.onTap,
    required this.isSelected,
  });

  final int index;
  final ValueChanged<int> onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(0.5),
          child: ColoredBox(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: isSelected ? Colors.transparent : null,
              onTap: () => onTap(index),
              child: const Icon(Icons.home, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
