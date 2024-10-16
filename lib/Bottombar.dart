import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet/View/Booking/BookingPage.dart';
import 'package:pet/View/MyRescue/MyRescues.dart';
import 'package:pet/View/Profile/Profile.dart';


import 'View/Home/HomePage.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    BookingPage(),
    MyRescues(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, // Keeps track of which screen is displayed
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.encodeSans(
          textStyle: TextStyle(
            color: Color(0xffED6D4E),
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  "assets/Icon/BottomIcon.png",
                  height: 30,
                  width: 30,
                )
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icon/iconclock.png",
              height: 30,
              width: 30,
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icon/icon explore.png",
              height: 30,
              width: 30,
            ),
            label: 'Myrescue',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Icon/iconprofile.png",
              height: 30,
              width: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
