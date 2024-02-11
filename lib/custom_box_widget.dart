import 'package:flutter/material.dart';

class CustomBoxWidget extends StatelessWidget {
  final double aspectRatio;
  final Widget child;
  final Color color;

  const CustomBoxWidget({
    required this.aspectRatio,
    this.color = Colors.white,
    required this.child,
    super.key,
  });

  const CustomBoxWidget.one(
      {super.key,
      this.aspectRatio = 4,
      required this.child,
      this.color = Colors.white});
  const CustomBoxWidget.two(
      {super.key,
      this.aspectRatio = 2.75,
      required this.child,
      this.color = Colors.white});
  const CustomBoxWidget.three(
      {super.key,
      this.aspectRatio = 2.39,
      required this.child,
      this.color = Colors.white});
  const CustomBoxWidget.four(
      {super.key,
      this.aspectRatio = 1.85,
      required this.child,
      this.color = Colors.white});
  const CustomBoxWidget.five(
      {super.key,
      this.aspectRatio = 1.78,
      required this.child,
      this.color = Colors.white});
  const CustomBoxWidget.six(
      {super.key,
      this.aspectRatio = 1.66,
      required this.child,
      this.color = Colors.white});
  const CustomBoxWidget.seven(
      {super.key,
      this.aspectRatio = 1.33,
      required this.child,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        margin: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
        width: double.maxFinite,
        decoration: ShapeDecoration(
            shadows: const [BoxShadow(color: Colors.black45, blurRadius: 1.5)],
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: child,
      ),
    );
  }
}
