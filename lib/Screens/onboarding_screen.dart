// ignore_for_file: unused_import

import 'package:chat_app/Screens/log_in.dart';
import 'package:chat_app/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen(
      {super.key,
      required Color screenColor,
      required String firstText,
      required String imagePath,
      required String secondText});

  @override
  State<OnboardingScreen> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              const OnboardingScreen(
                screenColor: Colors.transparent,
                firstText:
                    "Enjoy fast and secure conversations with loved ones ",
                imagePath: "Assets/images/onpic.png",
                secondText: "The best communication app for you ",
              ),
              OnboardingScreen(
                screenColor: Colors.indigo.shade600,
                firstText: "Sending messages got better!!",
                imagePath: "Assets/images/onpic3.png",
                secondText: "Send up to 100 messages all at once",
              ),
              OnboardingScreen(
                screenColor: Colors.indigo.shade600,
                firstText: "Send pictures,videos,audios and even assign tasks",
                imagePath: "Assets/images/onpic2.png",
                secondText: "The new way of sending messages ",
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text("skip"),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: SwapEffect(activeDotColor: Colors.red.shade200),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SplashScreen(),
                              ));
                        },
                        child: const Text("Done"),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text("Next"),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
