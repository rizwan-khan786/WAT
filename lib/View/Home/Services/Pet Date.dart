import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../HomePage.dart';

class PData extends StatefulWidget {
  const PData({super.key});

  @override
  State<PData> createState() => _PDataState();
}

class _PDataState extends State<PData> {
  @override
  Widget build(BuildContext context) {
    double width, height;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.2,
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back(result: HomePage());
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.25,
                            ),
                            Center(
                              child: Text(
                                "Pet Data",
                                style: GoogleFonts.encodeSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Container(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/Icon/date.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 1,
                    height: height * 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for home serv...',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xffFFCF6F),
                              ),
                              suffixIcon: Card(
                                elevation: 1,
                                child: Container(
                                  width: 102,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Filter",
                                        style: GoogleFonts.encodeSans(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      PopupMenuButton<String>(
                                        icon: Icon(Icons.filter_alt_outlined),
                                        onSelected: (String result) {
                                          // Handle filter selection
                                          print(
                                              'Selected: $result'); // You can replace this with your filtering logic
                                        },
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[
                                          const PopupMenuItem<String>(
                                            value: 'Rating',
                                            child: Text('Rating'),
                                          ),
                                          const PopupMenuItem<String>(
                                            value: 'High to Low',
                                            child: Text('High to Low'),
                                          ),
                                          const PopupMenuItem<String>(
                                            value: 'Low to High',
                                            child: Text('Low to High'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FilterTab(text: "All", selected: true),
                              FilterTab(text: "Availability", selected: false),
                              FilterTab(text: "Rating", selected: false),
                            ],
                          ),
                          SizedBox(height: 16),
                          // Service cards
                          Expanded(
                            child: ListView(
                              children: [
                                ServiceCard(
                                  imageUrl:
                                      "https://bsmedia.business-standard.com/_media/bs/img/article/2023-11/02/full/1698936059-1337.jpeg?im=FeatureCrop,size=(826,465)",
                                  title: 'Wedding Photos',
                                  rating: 2.25,
                                  companyName: 'Pet Veterinary',
                                  address: '43900 Bandra',
                                  Person: "From(4)",
                                ),
                                ServiceCard(
                                  imageUrl:
                                      'https://www.raycochrane.co.uk/wp-content/uploads/2024/05/Blog-Post-Headers-17-1024x576.png',
                                  title: 'Facials Services',
                                  rating: 0.0,
                                  companyName: 'Pet Veterinary',
                                  address: '400025 Dadar',
                                  Person: "From(0)",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  final String text;
  final bool selected;

  FilterTab({required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Color(0xffED6D4E) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final String companyName;
  final String address;
  final String Person;

  ServiceCard(
      {required this.imageUrl,
      required this.title,
      required this.rating,
      required this.companyName,
      required this.address,
      required this.Person});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                // Text Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 4),
                          Text(
                            Person,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        companyName,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        address,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add action for Book Now
                  },
                  child: Text(
                    'Call Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffED6D4E), // Button color
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffED6D4E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
