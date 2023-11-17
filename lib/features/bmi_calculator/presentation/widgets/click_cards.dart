import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';

class ClickCards extends StatelessWidget {
  final bool isSelected;
  final Widget child;
  const ClickCards({super.key, required this.isSelected, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected == true
            ? AppTheme.darkGrey2Color
            : AppTheme.darkGrey1Color,
        border: Border.all(
          color: AppTheme.darkBlue1Color,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: child),
    );
  }
}
