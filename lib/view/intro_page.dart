import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(flex: 3, child: Lottie.asset("assets/loading.json")),
            Flexible(
              flex: 2,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade300,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [ScaleAnimatedText('FAKE BOOKAPP')],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
