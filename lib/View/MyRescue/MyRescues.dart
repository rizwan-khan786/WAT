import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/color_constant.dart';
import '../Home/Add Photo.dart';

class MyRescues extends StatefulWidget {
  const MyRescues({super.key});

  @override
  State<MyRescues> createState() => _MyRescuesState();
}

class _MyRescuesState extends State<MyRescues> {
  @override
  Widget build(BuildContext context) {
    double width, height;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
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
                  Expanded(
                    child: Center(
                      child: Text(
                        "MyRescue",
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
        body: Container(
          width: width * 1,
          height: height * 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Rescue cards
                Expanded(
                  child: ListView(
                    children: [
                      ServiceCard(
                        imageUrl:
                            "https://wingsandtailsfoundation.in/wp-content/uploads/2021/05/WhatsApp-Image-2021-05-22-at-11.14.53.jpeg",
                        status: 'In Progress',
                        username: 'John Doe',
                        ngoName: 'Wildlife NGO',
                      ),
                      ServiceCard(
                        imageUrl:
                            'https://wingsandtailsfoundation.in/staging/wp-content/uploads/2021/12/cow2.png',
                        status: 'Completed',
                        username: 'Jane Smith',
                        ngoName: 'Animal Rescue Org',
                      ),
                      ServiceCard(
                        imageUrl:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpUu84yeEcot6T8DFJIqexM-sask8GG54RDmGliwjX42KubZ3YQnxqJ91-6_TMPYme6No&usqp=CAU",
                        status: 'In Progress',
                        username: 'Roshan Kumar',
                        ngoName: 'Wildlife NGO',
                      ),
                      ServiceCard(
                        imageUrl:
                            "https://wingsandtailsfoundation.in/wp-content/uploads/2021/05/WhatsApp-Image-2021-05-22-at-11.14.53.jpeg",
                        status: 'In Progress',
                        username: 'Neeraj Yadav',
                        ngoName: 'Wildlife NGO',
                      ),
                      ServiceCard(
                        imageUrl:
                            'https://wingsandtailsfoundation.in/staging/wp-content/uploads/2021/12/cow2.png',
                        status: 'Completed',
                        username: 'Jane Smith',
                        ngoName: 'Animal Rescue Org',
                      ),
                      ServiceCard(
                        imageUrl:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpUu84yeEcot6T8DFJIqexM-sask8GG54RDmGliwjX42KubZ3YQnxqJ91-6_TMPYme6No&usqp=CAU",
                        status: 'In Progress',
                        username: 'Roshan Kumar',
                        ngoName: 'Wildlife NGO',
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                'Rescue Pet',
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
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 100,
                width: 100,
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
                      color:
                          status == 'Completed' ? Colors.green : Colors.orange,
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
    );
  }
}
