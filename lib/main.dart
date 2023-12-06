// ignore_for_file: unused_import

import 'package:chat_app/Screens/Second_Home.dart';
import 'package:chat_app/Screens/log_in.dart';
import 'package:chat_app/Screens/onboarding_screen.dart';
import 'package:chat_app/Screens/profile_screen.dart';
import 'package:chat_app/Screens/sign_up.dart';
import 'package:chat_app/Screens/homepage.dart';
import 'package:chat_app/Screens/splash_screen.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//global variable
late Size mq;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // enter full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // for setting orientation to portrait only
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal, fontSize: 22),
      )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
