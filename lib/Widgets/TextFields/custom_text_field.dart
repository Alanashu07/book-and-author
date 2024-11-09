import 'package:book_and_author/Style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool hideText;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final String? type;
  final String? hintText;
  final String? labelText;
  final Color? labelColor;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;

  const CustomTextField(
      {super.key,
      this.hideText = false,
      this.maxLines = 5,
      this.minLines = 1,
      this.inputFormatters,
      this.textCapitalization,
      this.onTap,
      this.focusNode,
      required this.controller,
      this.type,
      this.hintText,
      this.labelText,
      this.labelColor,
      this.hintStyle,
      this.suffixIcon,
      this.prefixIcon,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: hideText ? 1 : maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      onTap: onTap,
      focusNode: focusNode,
      controller: controller,
      validator: (value) => value!.isNotEmpty ? null : "Enter $type",
      obscureText: hideText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black12)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppStyle.mainColor, width: 2)),
      ),
    );
  }
}
