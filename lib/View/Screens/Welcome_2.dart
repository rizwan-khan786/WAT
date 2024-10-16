import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Welcome_3.dart';

class Welcome_2 extends StatefulWidget {
  const Welcome_2({super.key});

  @override
  State<Welcome_2> createState() => _Welcome_2State();
}

class _Welcome_2State extends State<Welcome_2> {
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
              Image.asset("assets/Images/Welcome_2.png"),
              SizedBox(
                height: 5,
              ),
              Image.asset("assets/Images/2.png"),
              SizedBox(
                height: 30,
              ),
              Text(
                "Proven experts",
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
                "We interview every specialist before\n                they get to work",
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
                          MaterialPageRoute(builder: (context) => Welcome_3()));
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
