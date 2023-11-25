import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/newshome.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int botNavBarOption = 2;

  void botNavBarTap(int indexBnb) {
    setState(() {
      botNavBarOption = indexBnb;

      if (indexBnb == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else if (indexBnb == 1) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NewsHome()));
      } else if (indexBnb == 2) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
    });
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xFF0D1333),
      currentIndex: botNavBarOption,
      onTap: botNavBarTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Edithor.ial",
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
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
