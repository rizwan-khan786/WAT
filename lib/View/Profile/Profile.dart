import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet/View/Profile/MyProfile.dart';

import '../../Utils/color_constant.dart';
import 'Help.dart';
import 'Myfavourite.dart';
import 'Mypets.dart';
import 'Setting.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.height * 1,
          child: Column(
            children: [
              Stack(
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.height * 1,
                      height: 260,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 150),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Profile",
                                style: GoogleFonts.encodeSans(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 10),
                          //   child: Image.asset("assets/Icon/Pen.png"),
                          // ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 10),
                          //   child: Text(
                          //     "Edit",
                          //     style: GoogleFonts.encodeSans(
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.bold,
                          //         color: Color(0xff4552CB)),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/Images/Profile.png"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Maria Martinez",
                        style: GoogleFonts.encodeSans(
                            textStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Kiev",
                        style: GoogleFonts.encodeSans(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffBBC3CE))),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.wallet, color: ColorConstants.Button)),
                title: Text(
                  "Wallet",
                  style: GoogleFonts.encodeSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff070821))),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(MyProfile());
                },
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 20, child: Image.asset("assets/Icon/pet.png")),
                  title: Text(
                    "My Profile",
                    style: GoogleFonts.encodeSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff070821))),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mypets()));
                },
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 20, child: Image.asset("assets/Icon/help.png")),
                  title: Text(
                    "My Pets",
                    style: GoogleFonts.encodeSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff070821))),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Myfavourite()));
                },
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 20, child: Image.asset("assets/Icon/heart.png")),
                  title: Text(
                    "My favourites",
                    style: GoogleFonts.encodeSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff070821))),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                    radius: 20,
                    child: Image.asset("assets/Icon/announcement.png")),
                title: Text(
                  "Invite friends",
                  style: GoogleFonts.encodeSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff070821))),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HelpPage()));
                },
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset("assets/Icon/question.png")),
                  title: Text(
                    "Help",
                    style: GoogleFonts.encodeSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff070821))),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 20,
                      child: Image.asset("assets/Icon/settings gear.png")),
                  title: Text(
                    "Settings",
                    style: GoogleFonts.encodeSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff070821))),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
