import 'package:flutter/material.dart';

class Mypetdetail extends StatefulWidget {
  const Mypetdetail({super.key});

  @override
  State<Mypetdetail> createState() => _MypetdetailState();
}

class _MypetdetailState extends State<Mypetdetail> {
  final String imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbqolv79NwuFemU0qhAbltZGRtCAJlhrjPE5N655kut0Nez1W4E_wQ1lt_7UUPhx7thh4&usqp=CAU';
  final String petName = "Sheru";
  final String species = "Corgi";
  final String breed = "3 months";
  final String gender = "Female";
  final String dateOfBirth = "Feb 20";
  final String detailPage =
      "Sheru is a friendly and playful dog who loves to be around people. He is well-trained and enjoys long walks.";
      
  final List<Map<String, String>> vaccines = [
    {
      'name': 'Rabies',
      'date': 'Jan 10, 2023',
      'expiry': 'Jan 10, 2024',
    },
    {
      'name': 'Parvovirus',
      'date': 'Feb 20, 2023',
      'expiry': 'Feb 20, 2024',
    },
    {
      'name': 'Distemper',
      'date': 'Mar 15, 2023',
      'expiry': 'Mar 15, 2024',
    },
    {
      'name': 'Hepatitis',
      'date': 'Apr 12, 2023',
      'expiry': 'Apr 12, 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display single image
              Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Info Card Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoCard('Species', species),
                    _infoCard('Breed', breed),
                    _infoCard('Gender', gender),
                    _infoCard('DOB', dateOfBirth),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pet Name: $petName',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Pet Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Detail: $detailPage',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Vaccine Details Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Vaccine Details:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: vaccines.map((vaccine) {
                    return Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vaccine: ${vaccine['name']}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Date: ${vaccine['date']}",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Expiry: ${vaccine['expiry']}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _infoCard(String title, String value) {
  return Expanded(
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
