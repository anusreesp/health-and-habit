import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';

class GreyRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconName;
  final Color? iconColor;
  final double? iconSize;
  const GreyRoundedButton(
      {super.key,
      required this.onTap,
      required this.iconName,
      this.iconColor,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.darkGrey1Color,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppTheme.darkBlue1Color)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            iconName,
            color: iconColor ?? AppTheme.whiteColor,
            size: iconSize ?? 36,
          ),
        ),
      ),
    );
  }
}
