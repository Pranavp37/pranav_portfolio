import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final maxSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: maxSize.height / 1.6,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Hai,\nI'm Pranav P\nA Flutter Developer",
                    textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: 280,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      textStyle: WidgetStatePropertyAll(
                          TextStyle(fontWeight: FontWeight.bold)),
                      elevation: WidgetStatePropertyAll(0),
                      backgroundColor: WidgetStatePropertyAll(
                        CustomColor.yellowPrimary,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Get in touch',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
          Image.asset(
            'assets/img/pranav_img.png',
            height: maxSize.height / 2,
            width: maxSize.width / 3,
          )
        ],
      ),
    );
  }
}
