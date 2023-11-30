import 'package:chat_app/Widgets/conversationList.dart';
import 'package:flutter/material.dart';

import '../models/chatUsersModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        imagePath: "Assets/images/Pf2.jpg",
        messageText: "  I sent the documents to the office",
        name: "Angela Young",
        time: "Now"),
         ChatUsers(
        imagePath: "Assets/images/pf7.jpg",
        messageText: "Hey what's up?",
        name: "Emily White",
        time: "10:46am"),
   ChatUsers(
        imagePath: "Assets/images/Pf6.jpg",
        messageText: "Monday is a holiday",
        name: "Mr Wesley",
        time: "Yesterday"),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor:const Color(0xFF553380),
        title: const Text("Chatapp" , style: TextStyle(fontSize: 23),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imagePath: chatUsers[index].imagePath,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
