import 'package:flutter/material.dart';
import 'package:news_app/pages/about.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/profile.dart';
import 'package:news_app/pages/settings.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  int botNavBarOption = 1;

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

  Widget _buildGenreWidget(String genre, List<Widget> sourceWidgets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          genre,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: sourceWidgets,
          ),
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSourceWidget(String name, String logoPath) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(logoPath),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionIndicator() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
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
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          _buildGenreWidget('Science and Technology', [
            _buildSourceWidget('Recombu', 'images/recombu-t.png'),
            _buildSourceWidget('PhoneRadar', 'images/phoneradar-t.jpg'),
            _buildSourceWidget('GameByte', 'images/gamebyte-t.png'),
            _buildSourceWidget('New Scientist', 'images/ns-t.jpg'),
            _buildSourceWidget('ChannelBiz', 'images/channelbiz-t.png'),
          ]),
          _buildGenreWidget('Entertainment', [
            _buildSourceWidget('Ok! Magazine', 'images/ok-e.jpg'),
            _buildSourceWidget('RadioTimes', 'images/radiotimes-e.png'),
            _buildSourceWidget('Student Problems', 'images/sp-e.jpg'),
            _buildSourceWidget('NME', 'images/nme-e.png'),
            _buildSourceWidget('Funny Vines', 'images/fv-e.jpg'),
          ]),
          _buildGenreWidget('Health and Fitness', [
            _buildSuggestionIndicator(),
            _buildSourceWidget('Fehresian\nEnergetics', 'images/fehr-h.jpg'),
            _buildSourceWidget('Healthhunt', 'images/healthhunt-h.jpg'),
            _buildSourceWidget('Nursing Times', 'images/nt-h.png'),
            _buildSourceWidget(
                'Pharmaceutical\nTechnology', 'images/phartech-h.jpg'),
            _buildSourceWidget('TheMindClan', 'images/themindclan-h.jpg'),
          ]),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
