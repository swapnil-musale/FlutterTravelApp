import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double margin = 0;
  double opacity = 1;
  double width = 200;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.all(margin),
        width: width,
        color: color,
        duration: const Duration(seconds: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                child: const Text(
                  "Animate Margin",
                ),
                onPressed: () => setState(() {
                      margin = margin == 0 ? 100 : 0;
                    })),
            OutlinedButton(
                child: const Text(
                  "Animate Color",
                ),
                onPressed: () => setState(() {
                      color = color == Colors.purple ? Colors.blue : Colors.purple;
                    })),
            OutlinedButton(
                child: const Text(
                  "Animate Width",
                ),
                onPressed: () => setState(() {
                      width = width == 200 ? 400 : 200;
                    })),
            OutlinedButton(
                child: const Text(
                  "Animate Opacity",
                ),
                onPressed: () => setState(() {
                      opacity = opacity == 1 ? 0 : 1;
                    })),
            AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 2),
                child: const Text("Hide Me",
                    style: TextStyle(color: Colors.black, fontSize: 24)))
          ],
        ),
      ),
    );
  }
}
