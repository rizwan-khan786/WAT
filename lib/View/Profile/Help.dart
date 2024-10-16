import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  final List<HelpItem> helpTopics = [
    HelpItem(icon: Icons.info, title: 'FAQ'),
    HelpItem(icon: Icons.feedback, title: 'Send Feedback'),
    HelpItem(icon: Icons.report_problem, title: 'Report a Problem'),
    HelpItem(icon: Icons.phone, title: 'Contact Us'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Help & Support'),
      ),
      body: ListView.separated(
        itemCount: helpTopics.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(helpTopics[index].icon),
            title: Text(helpTopics[index].title),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle tap
              print('${helpTopics[index].title} tapped');
              // You can navigate to another page or show a dialog here
            },
          );
        },
      ),
    );
  }
}

class HelpItem {
  final IconData icon;
  final String title;

  HelpItem({required this.icon, required this.title});
}
