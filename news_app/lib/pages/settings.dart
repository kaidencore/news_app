import 'package:flutter/material.dart';
import 'package:news_app/pages/about.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/sign_in.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                  fontFamily: 'Lora',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF001747),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF001747),
              ),
              child: Text(
                'Welcome, Mary!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Lora',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Signin()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SettingsPage(),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            buildSettingsCategory('Account', [
              buildSettingsItem('Edit Profile'),
              buildSettingsItem('Notifications'),
              buildSettingsItem('Privacy and Data'),
            ]),
            buildSettingsCategory('Login', [
              buildSettingsItem('Security'),
              buildSettingsItem('Logout'),
            ]),
            buildSettingsCategory('Support', [
              buildSettingsItem('Get help'),
              buildSettingsItem('Terms of Service'),
              buildSettingsItem('Privacy policy'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsCategory(String categoryTitle, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
        Column(
          children: items,
        ),
      ],
    );
  }

  Widget buildSettingsItem(String settingItem) {
    return ListTile(
      title: Text(settingItem),
      onTap: () {
        /*
      switch (settingItem) {
        case 'Edit Profile':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ),
          );
          break;
        case 'Notifications':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ),
          );
          break;
        default:
          break;
      }
      */
      },
    );
  }
}
