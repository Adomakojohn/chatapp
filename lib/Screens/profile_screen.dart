// ignore_for_file: unused_import

import 'package:chat_app/Screens/log_in.dart';
import 'package:chat_app/Screens/sign_up.dart';

import 'package:chat_app/Screens/homepage.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

// ignore: camel_case_types
class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Profile Settings"),
      ),
    );
  }
}
