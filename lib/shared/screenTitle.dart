import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({required Key key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.easeInOut,
        builder: (BuildContext context, double opacity, Widget? child) {
          return Opacity(
              opacity: opacity,
              child: Padding(
                padding: EdgeInsets.only(top: opacity * 20),
                child: child,
              ));
        },
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
