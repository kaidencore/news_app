import 'package:flutter/material.dart';

import 'home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          children: [
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "images/city.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text("Behold the gateway to the unfiltered truth.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 20.0,
            ),
            Text("No. 1 Most Trusted News Source of 2023",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 5.0,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF00072d),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text("Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500)),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
