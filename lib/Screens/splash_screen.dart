// ignore_for_file: unused_import, avoid_print

import 'package:animated_switch/animated_switch.dart';
import 'package:chat_app/Screens/homepage.dart';
import 'package:chat_app/Screens/log_in.dart';
import 'package:chat_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

//stateful class for the Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //exit fullScreen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if (FirebaseAuth.instance.currentUser != null) {
        print('\nUser: ${FirebaseAuth.instance.currentUser}');

        print('\nUser: ${FirebaseAuth.instance.currentUser}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LogInScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .15,
              right: mq.width * .1,
              width: mq.width * .80,
              child: Image.asset(
                'Assets/Icons/ChatIcon.png',
                height: 300,
              )),
          //google login
          Positioned(
              height: mq.height * .070,
              top: mq.height * .85,
              width: mq.width * .78,
              left: 35,
              child: const Text(
                "MADE IN GHANA?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Colors.black, letterSpacing: 2),
              )),
        ],
      ),
    );
  }
}
