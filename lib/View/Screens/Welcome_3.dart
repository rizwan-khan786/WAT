import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet/View/Screens/Login.dart';

class Welcome_3 extends StatefulWidget {
  const Welcome_3({super.key});

  @override
  State<Welcome_3> createState() => _Welcome_3State();
}

class _Welcome_3State extends State<Welcome_3> {
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
              Image.asset("assets/Images/Welcome_3.png"),
              SizedBox(
                height: 5,
              ),
              Image.asset("assets/Images/3.png"),
              SizedBox(
                height: 30,
              ),
              Text(
                "Reliable reviews",
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
                "A review can be left only by a user\n         who used the service",
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
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Get started",
                      style: GoogleFonts.encodeSans(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
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
