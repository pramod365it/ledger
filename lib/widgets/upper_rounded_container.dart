import 'package:flutter/material.dart';

class UpperRoundedContainer extends StatelessWidget {
  const UpperRoundedContainer({
    Key? key,
    required this.aboveCornersColor,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color aboveCornersColor;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: aboveCornersColor),
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
