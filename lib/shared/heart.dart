import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;
  late Animation<double> curveAnimation;
  bool isFavoriteMarked = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    curveAnimation = CurvedAnimation(parent: animationController, curve: Curves.slowMiddle);
    colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(curveAnimation);

    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(animationController);

    animationController.addListener(() {
      if (kDebugMode) {
        print(animationController.value);
      }
    });

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFavoriteMarked = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFavoriteMarked = false;
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorAnimation.value,
            size: sizeAnimation.value,
          ),
          onPressed: () {
            isFavoriteMarked
                ? animationController.reverse()
                : animationController.forward();
          },
        );
      },
    );
  }
}
