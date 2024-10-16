import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final List<SettingItem> settings = [
    SettingItem(icon: Icons.info, title: 'About'),
    SettingItem(icon: Icons.visibility, title: 'Appearance'),
    SettingItem(icon: Icons.security, title: 'Privacy Policy'),
    SettingItem(icon: Icons.policy, title: 'Terms & Conditions'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: ListView.separated(
        itemCount: settings.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(settings[index].icon),
            title: Text(settings[index].title),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle tap
              print('${settings[index].title} tapped');
            },
          );
        },
      ),
    );
  }
}

class SettingItem {
  final IconData icon;
  final String title;

  SettingItem({required this.icon, required this.title});
}
