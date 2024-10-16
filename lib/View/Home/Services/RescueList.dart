import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/color_constant.dart';
import '../Add Photo.dart';
import '../DetailPage/RescueDetailPage.dart';
import '../HomePage.dart';

class RescueList extends StatefulWidget {
  const RescueList({super.key});

  @override
  State<RescueList> createState() => _RescueListState();
}

class _RescueListState extends State<RescueList> {
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
                        "Rescued",
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
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbqolv79NwuFemU0qhAbltZGRtCAJlhrjPE5N655kut0Nez1W4E_wQ1lt_7UUPhx7thh4&usqp=CAU",
                      status: 'In Progress',
                      username: 'John Doe',
                      ngoName: 'Wildlife NGO',
                    ),
                    ServiceCard(
                      imageUrl:
                          'https://res.cloudinary.com/purnesh/image/upload/f_auto/v1522663766/pet-renting.jpg',
                      status: 'Completed',
                      username: 'Jane Smith',
                      ngoName: 'Animal Rescue Org',
                    ),
                    ServiceCard(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbqolv79NwuFemU0qhAbltZGRtCAJlhrjPE5N655kut0Nez1W4E_wQ1lt_7UUPhx7thh4&usqp=CAU",
                      status: 'In Progress',
                      username: 'John Doe',
                      ngoName: 'Wildlife NGO',
                    ),
                    ServiceCard(
                      imageUrl:
                          'https://res.cloudinary.com/purnesh/image/upload/f_auto/v1522663766/pet-renting.jpg',
                      status: 'Completed',
                      username: 'Jane Smith',
                      ngoName: 'Animal Rescue Org',
                    ),
                    ServiceCard(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbqolv79NwuFemU0qhAbltZGRtCAJlhrjPE5N655kut0Nez1W4E_wQ1lt_7UUPhx7thh4&usqp=CAU",
                      status: 'In Progress',
                      username: 'John Doe',
                      ngoName: 'Wildlife NGO',
                    ),
                    ServiceCard(
                      imageUrl:
                          'https://res.cloudinary.com/purnesh/image/upload/f_auto/v1522663766/pet-renting.jpg',
                      status: 'Completed',
                      username: 'Jane Smith',
                      ngoName: 'Animal Rescue Org',
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 320,
              //   child: Padding(
              //     padding: const EdgeInsets.only(bottom: 10),
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Get.to(AddListingScreen());
              //       },
              //       child: Text(
              //         'Rescue Pet',
              //         style: GoogleFonts.raleway(
              //             fontWeight: FontWeight.w600,
              //             fontSize: 16,
              //             color: Colors.white),
              //       ),
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: ColorConstants.ButtonColor,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        // Fixed button at the bottom of the screen
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
                'Request Rescue',
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

// Service card widget to display rescue information
class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String username;
  final String ngoName;

  ServiceCard({
    required this.imageUrl,
    required this.status,
    required this.username,
    required this.ngoName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            Get.to(RescueDetailPage());
          },
          child: Row(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 120,
                  width: 120,
                  child: Image.network(
                    imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Rescue Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      'Status: $status',
                      style: TextStyle(
                        color: status == 'Completed'
                            ? Colors.green
                            : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      ngoName,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
