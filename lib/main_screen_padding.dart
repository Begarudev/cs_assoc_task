import 'package:flutter/material.dart';

class PaddingCustom extends StatelessWidget {
  final Widget widget;
  const PaddingCustom({
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: widget,
    );
  }
}
