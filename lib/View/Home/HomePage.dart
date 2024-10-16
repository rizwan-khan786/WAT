import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'DetailPage/PetDetailScreen.dart';
import 'Package.dart';
import 'Services/Adoption.dart';
import 'Services/RescueList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/Icon/close icon.png")),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 70,
                      ),
                      child: Text(
                        "Add pet detail",
                        style: GoogleFonts.encodeSans(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff070821),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Color(0xffF1A852),
                  ),
                ),
                title: Text(
                  "Faster check-in at appointment.",
                  style: GoogleFonts.encodeSans(
                      textStyle: TextStyle(fontSize: 16)),
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Color(0xffF1A852),
                  ),
                ),
                title: Text(
                  "Schedule of vaccination, haircuts,\ninspections etc.",
                  style: GoogleFonts.encodeSans(
                      textStyle: TextStyle(fontSize: 16)),
                ),
              ),
              ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Color(0xffF1A852),
                  ),
                ),
                title: Text(
                  "Reminder of the upcoming events\nwith your pet.",
                  style: GoogleFonts.encodeSans(
                      textStyle: const TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffED6D4E)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetDetailForm()));
                      },
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Icon(
                              Icons.add,
                              color: Color(0xffFFFFFF),
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Add",
                              style: GoogleFonts.encodeSans(
                                textStyle: const TextStyle(
                                    color: Color(0xffFFFFFF), fontSize: 16),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF0F0F8)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            "No, later",
                            style: GoogleFonts.encodeSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff070821)),
                            ),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  final videoURL = "https://www.youtube.com/watch?v=GiYucfWzuPo&t=19s";
  late YoutubePlayerController _controller;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showModalBottomSheet();
    });
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  final CarouselSliderController controller = CarouselSliderController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset("assets/Images/logo.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 240),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CarouselSlider(
                      items: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            width: double.infinity,
                            child: Image.asset(
                              "assets/Images/s1.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/Images/s2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            width: double.infinity,
                            child: Image.asset(
                              "assets/Images/Slider3.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        viewportFraction: 0.9,
                        height: 150,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Color(0xffF1A852),
                        dotColor: Color(0xffFFCF6F)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(RescueList());
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/helping.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Rescue",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: const TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(Adoption());
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/adoption.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Adoption",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(PackagePage());
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/grooming.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Grooming",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: const TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(PackagePage());
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/training.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Training ",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            showComingSoonDialog(context);
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/dog walking.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Dog walking",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                          ),
                          child: InkWell(
                            onTap: () {
                              showComingSoonDialog(context);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/boarding.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Pet boarding",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            showComingSoonDialog(context);
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/taxi.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Pet taxi",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            showComingSoonDialog(context);
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/date.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Pet date",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: InkWell(
                          onTap: () {
                            showComingSoonDialog(context);
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/Icon/other.png",
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Other",
                                  style: GoogleFonts.encodeSans(
                                      textStyle: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 96,
                    width: 343,
                    child: Image.asset(
                      "assets/Images/s3.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        onReady: () => debugPrint('Ready'),
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(
                            isExpanded: true,
                            colors: ProgressBarColors(
                                playedColor: Colors.redAccent,
                                handleColor: Colors.orange),
                          ),
                          PlaybackSpeedButton(),
                          RemainingDuration(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

void showComingSoonDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Coming Soon'),
        content: Text('This feature will be available soon!'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
