import 'package:flutter/material.dart';

import '../../Style/app_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? color;
  final Widget? child;
  const CustomButton({super.key, this.height, this.width, this.color, this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? mq.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppStyle.mainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}
