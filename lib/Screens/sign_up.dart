import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
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
                    'Sign Up',
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
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: "Full Name",
                        label: Text("Full Name"),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                      ),
                    ),
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
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          label: const Text("Confirm Password"),
                          fillColor: const Color(0xffD8D8DD),
                          filled: true,
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.visibility_off))),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: IntlPhoneField(
                        controller: _phoneNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          fillColor: Color(0xffD8D8DD),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'GH',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      )),
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
                            "Sign Up",
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
                      onTap: () {},
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
                            Text(' Sign Up with Google',
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
                          "Already have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "   Log In",
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
