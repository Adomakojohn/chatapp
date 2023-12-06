// ignore_for_file: file_names, avoid_print, unused_import

import 'dart:developer';
import 'package:chat_app/Screens/profile_screen.dart';
import 'package:chat_app/models2/chat_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/widgets2/chat_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../api/apis.dart';
import 'dart:convert';

class SecondHome extends StatefulWidget {
  const SecondHome({super.key});

  @override
  State<SecondHome> createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  List<ChatUser> list = [];
  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text("Chat Wave"),
        actions: [
          // search user button
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

          //more features button
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => profile_screen(user: APIs.me)));
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          child: const Icon(Icons.add_comment_rounded),
        ),
      ),
      //body
      body: StreamBuilder(
        stream: APIs.getAllUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // if data is not loading
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());

            // if some or all data is loaded show it
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;
              list =
                  data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];

              if (list.isNotEmpty) {
                return ListView.builder(
                    itemCount: list.length,
                    padding: EdgeInsets.only(top: mq.height * .01),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatUserCard(user: list[index]);
                      // return Text('Name: ${list[index]}');
                    });
              } else {
                return const Center(
                    child: Text(
                  "No Users found",
                  style: TextStyle(fontSize: 20),
                ));
              }
          }
        },
      ),
    );
  }
}
