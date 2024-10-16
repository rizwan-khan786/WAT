import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utils/color_constant.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final TextEditingController _controller = TextEditingController();

  // Function to launch Google Maps with the entered location
  void _launchMapsUrl() async {
    final String location = _controller.text.trim();
    if (location.isNotEmpty) {
      final String url =
          'https://www.google.com/maps/search/?api=1&query=$location';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a location')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Image.asset(
                  "assets/Images/map.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 16), // Add some spacing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  maxLines: 5,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Enter Location",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 16), // Add some spacing
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.ButtonColor,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: _launchMapsUrl,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
