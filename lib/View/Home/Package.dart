import 'package:flutter/material.dart';

import '../../Utils/color_constant.dart';

class PackagePage extends StatelessWidget {
  final List<Package> packages = [
    Package(
      packageName: 'Basic Package',
      discountPrice: '₹1,200',
      realPrice: '₹1,500',
      descriptionPoints: [
        'Basic grooming',
        'Regular vaccinations',
        'Health check-up',
      ],
    ),
    Package(
      packageName: 'Standard Package',
      discountPrice: '₹2,500',
      realPrice: '₹3,000',
      descriptionPoints: [
        'Grooming + Nail trimming',
        'Vaccinations included',
        'Diet consultation',
        'Annual health check-up',
      ],
    ),
    Package(
      packageName: 'Premium Package',
      discountPrice: '₹4,000',
      realPrice: '₹5,000',
      descriptionPoints: [
        'Complete grooming service',
        'All vaccinations',
        'Nutrition plan',
        'Emergency support',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Care Packages'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: packages.length,
          itemBuilder: (context, index) {
            final package = packages[index];
            return PackageCard(package: package);
          },
        ),
      ),
    );
  }
}

class Package {
  final String packageName;
  final String discountPrice;
  final String realPrice;
  final List<String> descriptionPoints;

  Package({
    required this.packageName,
    required this.discountPrice,
    required this.realPrice,
    required this.descriptionPoints,
  });
}

class PackageCard extends StatelessWidget {
  final Package package;

  const PackageCard({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Package Name
            Text(
              package.packageName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),

            // Prices
            Row(
              children: [
                Text(
                  'Discount Price: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  package.discountPrice,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  package.realPrice,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Description Points
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: package.descriptionPoints
                  .map((point) => Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              point,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),

            SizedBox(height: 16), // Add some space before the button

            // Buy Now Button
            TextButton(
              onPressed: () {
                // Action when the button is pressed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${package.packageName} purchased!')),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: ColorConstants.Button,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
