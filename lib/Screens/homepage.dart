import 'package:chat_app/Screens/chatpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const ChatPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 39, 67, 227),
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items:const  [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/Icons/conversation.png")),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/Icons/phone-call.png")),
            label: "Phone",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/Icons/settings.png")),
            label: "Settings", 
          ),
        ],
      ),
    );
  }
}
