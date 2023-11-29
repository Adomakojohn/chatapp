import 'package:animated_switch/animated_switch.dart';
import 'package:chat_app/Screens/homepage.dart';
import 'package:chat_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//stateful class for the login screen
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isAnimate = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _handleGoogleBtnClick() {
    _signInWithGoogle().then((user) {
      // ignore: avoid_print
      print('\nUser: ${user.user}');
      // ignore: avoid_print
      print('\nUser: ${user.additionalUserInfo}');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome to Chat Wave"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
              top: mq.height * .15,
              right: _isAnimate ? mq.width * .15 : -mq.width * .5,
              width: mq.width * .80,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'Assets/Icons/ChatIcon.png',
                height: 300,
              )),
          Positioned(
              height: mq.height * .070,
              top: mq.height * .70,
              width: mq.width * .78,
              left: mq.width * .11,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 255, 187),
                      elevation: 1),
                  onPressed: () {
                    _handleGoogleBtnClick();
                  },
                  icon: Image.asset(
                    'Assets/images/googleLogo.png',
                    height: mq.height * .03,
                  ),
                  label: const Text(
                    "Sign In With Google",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ))),
        ],
      ),
    );
  }
}
