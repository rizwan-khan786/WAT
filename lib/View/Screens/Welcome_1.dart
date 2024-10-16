import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Welcome_2.dart';

class Welcome_1 extends StatefulWidget {
  const Welcome_1({super.key});

  @override
  State<Welcome_1> createState() => _Welcome_1State();
}

class _Welcome_1State extends State<Welcome_1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset("assets/Images/welcome_1.png"),
              SizedBox(
                height: 5,
              ),
              Image.asset("assets/Images/1.png"),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome to pet",
                style: GoogleFonts.encodeSans(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xff070821))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "All types of services for your pet in one\n        place, instantly searchable",
                style: GoogleFonts.encodeSans(
                    textStyle: TextStyle(
                  fontSize: 12,
                  color: Color(0xff070821),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffED6D4E),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Welcome_2()));
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.encodeSans(
                          textStyle: TextStyle(fontSize: 12),
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
