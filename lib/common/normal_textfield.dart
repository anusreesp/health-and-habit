import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final InputBorder? textBorder;
  final bool isObscureText;
  final String? Function(String?)? validator;
  final FocusNode? focus;

  const NormalTextField({
    required this.controller,
    required this.hintText,
    this.textBorder,
    this.isObscureText = false,
    super.key,
    this.validator,
    this.focus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: AppTheme.darkGrey1Color.withOpacity(0.6)))),
      child: TextFormField(
        controller: controller,
        focusNode: focus,
        obscureText: isObscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          border: textBorder ?? InputBorder.none,
          hintStyle: const TextStyle(
            color: AppTheme.darkGrey1Color,
          ),
        ),
      ),
    );
  }
}
