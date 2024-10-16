import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/color_constant.dart';
import '../Add Photo.dart';
import '../DetailPage/AdoptionDetailPage.dart';
import '../HomePage.dart';

class Adoption extends StatefulWidget {
  const Adoption({super.key});

  @override
  State<Adoption> createState() => _AdoptionState();
}

class _AdoptionState extends State<Adoption> {
  @override
  Widget build(BuildContext context) {
    double width, height;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              width: width,
              height: height * 0.1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color(0xffED6D4E),
                    Color(0xffF1A852),
                  ],
                      stops: [
                    0.0,
                    1.0,
                  ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      tileMode: TileMode.repeated)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back(result: HomePage());
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Adoption",
                        style: GoogleFonts.encodeSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView(
                  shrinkWrap:
                      true, // Makes ListView take only the necessary height
                  physics:
                      NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                  children: [
                    ServiceCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLFYQMyuFmoJTICcSp2M-RPFCxSC8oNYLsnw&s',
                      petName: 'Max',
                      petBreed: 'Golden Retriever',
                      gender: 'Male',
                      color: 'Golden',
                      location: 'Delhi',
                      age: '2 Years',
                    ),
                    ServiceCard(
                      imageUrl:
                          'https://www.bellaandduke.com/wp-content/uploads/2024/06/A-guide-to-German-Shepherds-characteristics-personality-lifespan-and-more-featured-image.webp',
                      petName: 'Rocky',
                      petBreed: 'German Shepherd',
                      gender: 'Male',
                      color: 'Black and Tan',
                      location: 'Mumbai',
                      age: '3 Years',
                    ),
                    ServiceCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNtwF8YEzqnEU0AQpc0_lYzYjF4O2BYiGULw&s',
                      petName: 'Charlie',
                      petBreed: 'Mixed Breed',
                      gender: 'Male',
                      color: 'Brindle',
                      location: 'Bangalore',
                      age: '4 Years',
                    ),
                    ServiceCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBm13CrzHub3v_VALDBMe9gj1HlhzhCzdWzg&s',
                      petName: 'Luna',
                      petBreed: 'Persian',
                      gender: 'Female',
                      color: 'Grey',
                      location: 'Chennai',
                      age: '2.5 Years',
                    ),
                    ServiceCard(
                      imageUrl:
                          'https://cdn.mos.cms.futurecdn.net/32BQmiJYQEo4AQoGsncLH5.jpg',
                      petName: 'Spirit',
                      petBreed: 'Mustang',
                      gender: 'Female',
                      color: 'Brown',
                      location: 'Hyderabad',
                      age: '6 Years',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: 320,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.to(AddListingScreen());
              },
              child: Text(
                'Upload Your Pets',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.ButtonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final String imageUrl;
  final String petName;
  final String petBreed;
  final String gender;
  final String color;
  final String location;
  final String age;

  const ServiceCard({
    required this.imageUrl,
    required this.petName,
    required this.petBreed,
    required this.gender,
    required this.color,
    required this.location,
    required this.age,
    Key? key,
  }) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isLiked = false; // State variable for like status

  void toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle the like status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Adoptiondetailpage()),
          );
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image and Location
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.network(
                            widget.imageUrl,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        Text(
                          widget.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 16),
                // Pet Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3),
                      Text(
                        widget.petName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Breed: ${widget.petBreed}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Gender: ${widget.gender}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Age: ${widget.age}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Color: ${widget.color}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                // Like Icon
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: toggleLike,
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10),
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Adopt button clicked for ${widget.petName}");
                    },
                    child: Text(
                      "Adopt Now",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.ButtonColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
