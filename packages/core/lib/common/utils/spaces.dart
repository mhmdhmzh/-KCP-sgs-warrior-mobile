import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeightGap extends StatelessWidget {
  const HeightGap({required this.height, Key? key}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class WidthGap extends StatelessWidget {
  const WidthGap({required this.width, Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
