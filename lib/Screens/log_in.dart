import 'package:animated_switch/animated_switch.dart';
import 'package:chat_app/Screens/homepage.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.indigo,
              Colors.indigo.withOpacity(0.5),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: "Email Address",
                        label: Text("Email Address"),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          label: const Text("Password"),
                          fillColor: const Color(0xffD8D8DD),
                          filled: true,
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.visibility_off))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                    child: Row(
                      children: [
                        const AnimatedSwitch(
                          colorOff: Color(0xffA09F99),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        width: 375,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 239, 216, 12),
                        ),
                        child: const Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "----------------------------------",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'or',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "----------------------------------",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        _handleGoogleBtnClick();
                      },
                      child: Container(
                        height: 60,
                        width: 375,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 183, 183, 188),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/googleLogo.png')),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(' Log In with Google',
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "   Sign Up",
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
