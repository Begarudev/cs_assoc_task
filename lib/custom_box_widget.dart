import 'package:flutter/material.dart';

class CustomBoxWidget extends StatelessWidget {
  final Widget child;
  final double height;
  final Color color;

  const CustomBoxWidget({
    this.color = Colors.white,
    this.height = 200,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      decoration: ShapeDecoration(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: child,
    );
  }
}
