import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final  String secondText;
  // ignore: prefer_typing_uninitialized_variables
  final screenColor;

  // ignore: use_key_in_widget_constructors
  const OnboardingScreen({ required this.imagePath, required this.firstText , required this.secondText , required this.screenColor});
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Container(color: screenColor,
              child: Column(
                children: [
                const Spacer(),
                 // ignore: sized_box_for_whitespace
                 Container( 
                  height: 300,
                  width: 300,
                  child: Image.asset(imagePath,),
                 ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(textAlign: TextAlign.center,
                      firstText,
                      style: const TextStyle(fontSize: 28 , fontWeight: FontWeight.w500,),
                    ),
                  ),
                  Text(secondText,style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),),
                 const Spacer()
                ],
              ),
            ),
          );
  }
}