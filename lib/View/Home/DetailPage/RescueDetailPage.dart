import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RescueDetailPage extends StatefulWidget {
  @override
  _RescueDetailPageState createState() => _RescueDetailPageState();
}

class _RescueDetailPageState extends State<RescueDetailPage> {
  // PageController for image slider
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> _imageUrls = [
    'https://chompandchew.co.uk/wp-content/uploads/2023/11/german-shepherd-600x375.png',
    'https://dogwalkerseasternsuburbs.com/wp-content/uploads/german-shepard-featured-720x377.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU9lBWbQHL6fiJSK_4Jn1CoMEHB8XET3QCYozMs4Z3Ee3KJoqEivLkGPunDBPKhulJCac&usqp=CAU',
    'https://goofytails.com/cdn/shop/files/rottweiler_dog_breed_2000x.jpg?v=1702292041',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image slider with PageView
              Stack(
                children: [
                  Container(
                    height: 250,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: _imageUrls.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(
                            //   bottomLeft: Radius.circular(20),
                            //   bottomRight: Radius.circular(20),
                            // ),
                            image: DecorationImage(
                              image: NetworkImage(_imageUrls[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Get.back(result: null); // Navigate back
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_imageUrls.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.orangeAccent
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 16),

              // Display the details without card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    // Text(
                    //   'Rescue', // Example name
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(height: 8),

                    // Status
                    Text(
                      'Rescue : Completed', // Updated status
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green, // Set status color to green
                      ),
                    ),
                    SizedBox(height: 8),

                    // NGO Name
                    Text(
                      'Rescued By: Pet Rescue Foundation', // Example NGO name
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),

                    // Username
                    Text(
                      'Person: Karan Kumar', // Example username
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),

                    // Location
                    Text(
                      'Location: Mumbai', // Example location
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),

                    // Details
                    Text(
                      'Details: Jimmy is 3 months old, weighs 2kg, and is a female corgi.The dog is a domesticated descendant of the wolf. Also called the domestic dog, it was domesticated from an extinct population of wolves during the Late Pleistocene, over 14,000 years ago by hunter-gatherers, prior to the development of agriculture.', // Example details
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 16),
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
