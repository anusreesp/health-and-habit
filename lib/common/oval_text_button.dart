import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';

class OvalTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? height;
  final double? width;
  final Color? bgColor;
  final TextStyle textStyle;
  const OvalTextButton({
    super.key,
    required this.onTap,
    required this.title,
    this.height,
    this.width,
    this.bgColor,
    this.textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.whiteColor),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height ?? 45,
        width: width ?? MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
            color: bgColor ?? AppTheme.teal1Color,
            borderRadius: BorderRadius.circular(26)),
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

class OvalBorderButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? height;
  final double? width;
  final Color? bgColor;
  final TextStyle textStyle;
  final Color? borderColor;
  const OvalBorderButton({
    super.key,
    required this.onTap,
    required this.title,
    this.height,
    this.width,
    this.bgColor,
    this.textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.whiteColor),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height ?? 42,
        width: width ?? MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: borderColor ?? AppTheme.darkGrey1Color,
                blurRadius: 10,
                offset: Offset(0, 8)),
          ],
          color: bgColor ?? AppTheme.teal1Color,
          border: Border.all(
              color: borderColor ?? AppTheme.darkGrey1Color, width: 1),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
