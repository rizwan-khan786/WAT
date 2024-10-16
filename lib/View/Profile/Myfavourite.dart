import 'package:flutter/material.dart';

import '../../Utils/color_constant.dart';

class Myfavourite extends StatelessWidget {
  final List<Map<String, String>> favoritePets = [
    {
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLFYQMyuFmoJTICcSp2M-RPFCxSC8oNYLsnw&s',
      'petName': 'Max',
      'petBreed': 'Golden Retriever',
      'gender': 'Male',
      'color': 'Golden',
      'location': 'Delhi',
      'age': '2 Years',
    },
    {
      'imageUrl':
          'https://www.bellaandduke.com/wp-content/uploads/2024/06/A-guide-to-German-Shepherds-characteristics-personality-lifespan-and-more-featured-image.webp',
      'petName': 'Rocky',
      'petBreed': 'German Shepherd',
      'gender': 'Male',
      'color': 'Black and Tan',
      'location': 'Mumbai',
      'age': '3 Years',
    },
    // Add more pet data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourites'),
        centerTitle: true,
        // backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: favoritePets.length,
        itemBuilder: (context, index) {
          final pet = favoritePets[index];
          return FavoritePetCard(
            imageUrl: pet['imageUrl']!,
            petName: pet['petName']!,
            petBreed: pet['petBreed']!,
            gender: pet['gender']!,
            color: pet['color']!,
            location: pet['location']!,
            age: pet['age']!,
          );
        },
      ),
    );
  }
}

class FavoritePetCard extends StatefulWidget {
  final String imageUrl;
  final String petName;
  final String petBreed;
  final String gender;
  final String color;
  final String location;
  final String age;

  const FavoritePetCard({
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
  _FavoritePetCardState createState() => _FavoritePetCardState();
}

class _FavoritePetCardState extends State<FavoritePetCard> {
  bool isLiked = false; // Variable to track like status

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                // Like Button on the top right corner
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked; // Toggle the like status
                    });
                  },
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
