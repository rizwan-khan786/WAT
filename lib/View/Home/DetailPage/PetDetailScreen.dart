import 'package:flutter/material.dart';

import '../../../Utils/color_constant.dart';

class PetDetailForm extends StatefulWidget {
  @override
  _PetDetailFormState createState() => _PetDetailFormState();
}

class _PetDetailFormState extends State<PetDetailForm> {
  bool isMale = true;
  bool isNeutered = true;
  bool isVaccinated = true;
  bool isFriendlyWithDogs = true;
  bool isFriendlyWithCats = false;
  bool isFriendlyWithKidsUnder10 = true;
  bool isFriendlyWithKidsOver10 = true;
  bool isMicrochipped = true;
  bool isPurebred = true;
  DateTime selectedDate = DateTime(2018, 2, 25);
  List<Vaccine> vaccines = [];

  void _addVaccine() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String vaccineName = '';
        DateTime vaccineDate = DateTime.now();
        DateTime expiryDate = DateTime.now();

        return AlertDialog(
          title: Text('Add Vaccine'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Vaccine Name'),
                onChanged: (value) {
                  vaccineName = value;
                },
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: vaccineDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != vaccineDate) {
                    vaccineDate = picked;
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(labelText: 'Vaccine Date'),
                  child: Text(
                    '${vaccineDate.month}/${vaccineDate.day}/${vaccineDate.year}',
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: expiryDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  );
                  if (picked != null && picked != expiryDate) {
                    expiryDate = picked;
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(labelText: 'Expiry Date'),
                  child: Text(
                    '${expiryDate.month}/${expiryDate.day}/${expiryDate.year}',
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  vaccines.add(Vaccine(vaccineName, vaccineDate, expiryDate));
                });
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add pet detail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/Images/Pet.png'),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: ColorConstants.ButtonColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('General Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextFormField(
              decoration: InputDecoration(labelText: 'Pet’s name'),
              initialValue: 'Troy',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Species of your pet '),
              initialValue: 'Dog',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Breed'),
              initialValue: 'Toy terrier',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Size (optional)'),
              initialValue: 'Select',
            ),
            SizedBox(height: 10),
            Text('Gender', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Male Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    width: 140,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMale
                          ? ColorConstants.ButtonColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isMale ? Colors.transparent : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.male,
                          color: isMale ? Colors.white : Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: isMale ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                // Female Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    width: 140,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: !isMale
                          ? ColorConstants.ButtonColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: !isMale ? Colors.transparent : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.female,
                          color:
                              !isMale ? ColorConstants.TextColor : Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: !isMale
                                ? ColorConstants.TextColor
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(labelText: 'Date of Birth'),
                child: Text(
                  '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Additional Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: Text('Neutered'),
              value: isNeutered,
              onChanged: (bool value) {
                setState(() {
                  isNeutered = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SwitchListTile(
              title: Text('Vaccinated'),
              value: isVaccinated,
              onChanged: (bool value) {
                setState(() {
                  isVaccinated = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SwitchListTile(
              title: Text('Friendly with dogs'),
              value: isFriendlyWithDogs,
              onChanged: (value) {
                setState(() {
                  isFriendlyWithDogs = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SwitchListTile(
              title: Text('Friendly with cats'),
              value: isFriendlyWithCats,
              onChanged: (value) {
                setState(() {
                  isFriendlyWithCats = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SwitchListTile(
              title: Text('Friendly with kids under 10'),
              value: isFriendlyWithKidsUnder10,
              onChanged: (value) {
                setState(() {
                  isFriendlyWithKidsUnder10 = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SwitchListTile(
              title: Text('Friendly with kids over 10'),
              value: isFriendlyWithKidsOver10,
              onChanged: (value) {
                setState(() {
                  isFriendlyWithKidsOver10 = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SwitchListTile(
              title: Text('Microchipped'),
              value: isMicrochipped,
              onChanged: (value) {
                setState(() {
                  isMicrochipped = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SwitchListTile(
              title: Text('Purebred'),
              value: isPurebred,
              onChanged: (value) {
                setState(() {
                  isPurebred = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorConstants.SwitchButton,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: _addVaccine,
                    child: Container(
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text('Add Vaccine',
                              style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.Button,
                  minimumSize: Size(double.infinity, 50),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Vaccine {
  final String name;
  final DateTime date;
  final DateTime expiryDate;

  Vaccine(this.name, this.date, this.expiryDate);
}
