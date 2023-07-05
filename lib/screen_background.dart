import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground(
      {super.key, required this.child, required this.isNight});

  final Widget child;

  final bool isNight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //colors: [Colors.blue, Colors.cyan, Colors.lightBlue],
          colors: isNight
              ? [Colors.black, Colors.grey]
              : [Colors.blue, Colors.cyan, Colors.lightBlue],
        ),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      )),
    );
  }
}
