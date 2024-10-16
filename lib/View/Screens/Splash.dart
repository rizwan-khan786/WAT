import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet/View/Screens/Welcome_1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    print("Splash Screen Initialized");
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Welcome_1())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1A852),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Image.asset(
                "assets/dog.png",
                height: 250,
                width: 250,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Wings and Tails",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
