import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home/DetailPage/PetDetailScreen.dart';
import 'MyPetDetail.dart';

class Mypets extends StatefulWidget {
  const Mypets({super.key});

  @override
  State<Mypets> createState() => _MypetsState();
}

class _MypetsState extends State<Mypets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Pets"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PetServices(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbqolv79NwuFemU0qhAbltZGRtCAJlhrjPE5N655kut0Nez1W4E_wQ1lt_7UUPhx7thh4&usqp=CAU",
                    petName: 'Max',
                    species: 'Dog',
                    breed: 'Labrador Retriever',
                    gender: 'Male',
                    dateOfBirth: 'Feb 12, 2020',
                  ),
                  PetServices(
                    imageUrl:
                        'https://res.cloudinary.com/purnesh/image/upload/f_auto/v1522663766/pet-renting.jpg',
                    petName: 'Bella',
                    species: 'Cat',
                    breed: 'Siamese',
                    gender: 'Female',
                    dateOfBirth: 'May 7, 2018',
                  ),
                  PetServices(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbqolv79NwuFemU0qhAbltZGRtCAJlhrjPE5N655kut0Nez1W4E_wQ1lt_7UUPhx7thh4&usqp=CAU",
                    petName: 'Max',
                    species: 'Dog',
                    breed: 'Labrador Retriever',
                    gender: 'Male',
                    dateOfBirth: 'Feb 12, 2020',
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PetDetailForm()));
            },
            child: Text(
              'Add Pet',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffED6D4E),
            ),
          ),
        ),
      ),
    );
  }
}

class PetServices extends StatelessWidget {
  final String imageUrl;
  final String petName;
  final String species;
  final String breed;
  final String gender;
  final String dateOfBirth;

  PetServices({
    required this.imageUrl,
    required this.petName,
    required this.species,
    required this.breed,
    required this.gender,
    required this.dateOfBirth,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Mypetdetail()));
          },
          child: Row(
            children: [
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
              // Pet Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pet Name
                    Text(
                      petName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Species
                    Text(
                      'Species: $species',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    // Breed
                    Text(
                      'Breed: $breed',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    // Gender
                    Text(
                      'Gender: $gender',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    // Date of Birth
                    Text(
                      'DOB: $dateOfBirth',
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
