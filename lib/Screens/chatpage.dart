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
    ChatUsers(
        imagePath: "Assets/images/Pf3.jpg",
        messageText: "Alex didn't buy the car",
        name: "Charlotte ",
        time: "Yesterday"),
    ChatUsers(
        imagePath: "Assets/images/Pf5.jpg",
        messageText: "School starts next week",
        name: "Rob Thompson",
        time: "May 23"),
    ChatUsers(
        imagePath: "Assets/images/Pf4.jpg",
        messageText: "The ladder is in the garage",
        name: "Frank Howard",
        time: "December 22")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("Assets/Icons/chat-bubble.png"))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Chats",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox( width: 170,),
                  Expanded(
                    child: GestureDetector( onTap: () { },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                           color: Colors.white,
                           image: DecorationImage(image: AssetImage("Assets/Icons/write.png"))
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField( 
                  decoration: InputDecoration( hintText: "Search...", hintStyle:const TextStyle( fontSize: 19 , fontStyle: FontStyle.italic),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border:const OutlineInputBorder( 
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      )),
                ),
              ),
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
