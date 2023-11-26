import 'package:flutter/material.dart';
import 'package:news_app/pages/about.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/newshome.dart';
import 'package:news_app/pages/settings.dart';
import 'package:news_app/pages/sign_in.dart';

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
          label: 'Newsstand',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildInterestCard(
      {IconData? iconData, String? label, Color? bgColor, String? imageUrl}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
        border: Border.all(color: Colors.black54, width: 1.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: EdgeInsets.all(3.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUrl != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 1.2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (iconData != null && imageUrl == null)
            Icon(iconData, color: Colors.black),
          SizedBox(width: 10),
          Text(
            label ?? '',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 13,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF001747),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Padding(
          padding: EdgeInsets.only(right: 45.0),
          child: Center(
            child: Text(
              "Edithor.ial",
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          color: Colors.white,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/dev2.png'),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Mary Eddythe S. Sornito',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50), //end of profile
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Your Interests',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        _buildInterestCard(
                            iconData: Icons.computer,
                            label: 'Tech',
                            bgColor: Color.fromARGB(0, 0, 21, 21)),
                        _buildInterestCard(
                            imageUrl:
                                "https://st3.depositphotos.com/1071909/19574/i/450/depositphotos_195745476-stock-photo-artificial-intelligence-ai.jpg",
                            label: 'AI',
                            bgColor: Color.fromARGB(0, 0, 21, 21)),
                        _buildInterestCard(
                            imageUrl:
                                'https://static4.depositphotos.com/1000507/360/i/600/depositphotos_3606155-stock-photo-multi-coloured-wardrobe-showcase-closeup.jpg',
                            label: 'Fashion',
                            bgColor: Color.fromARGB(0, 0, 21, 21)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), //end of interests section
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Your Recently Read',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.book),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'You have no reading history yet. ',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () {},
                label: Text('Support the Edithor.ial'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF001747),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                icon: Icon(Icons.arrow_forward),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
