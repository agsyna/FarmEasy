import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = ScaleSize.textScaleFactor(context);

    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.07,
                ),
                Container(
                  child: IconButton(
                      iconSize: screenHeight * 0.09,
                      onPressed: () {},
                      icon: Icon(Icons.person)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Akash.....",
                  style: TextStyle(
                    // fontFamily: "Impact",
                    fontSize: textScaleFactor * 20,
                    // fontWeight:FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              height: 60,
              thickness: 3,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Handle navigation to Profile
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle navigation to Settings
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/homepagebg.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.060,
            ),
            Row(
              children: [
                SizedBox(
                  width: 0.04 * screenWidth,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff79B343),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.person_2_outlined),
                    iconSize: textScaleFactor * 30,
                    color: Color(0xffEDF5F4),
                    onPressed: () {
                      _globalKey.currentState!.openDrawer();
                    },
                  ),
                ),
                SizedBox(
                  width: 0.68 * screenWidth,
                ),
                IconButton(
                  onPressed: okay,
                  iconSize: textScaleFactor * 16,
                  icon: Image.asset(
                    "assets/icons/notification.png",
                    height: screenWidth * 0.1,
                    fit: BoxFit.cover,
                  ),
                  color: Color(0xff79B343),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.008,
            ),
            Container(
              height: screenHeight * 0.276,
              width: screenWidth * 0.88,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  // Colors.amber,
                  Color.fromRGBO(255, 255, 255, 150),
                  Color.fromRGBO(255, 255, 255, 100),
                  Color.fromRGBO(255, 255, 255, 50),
                ], stops: [
                  0,
                  50,
                  75
                ]),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.052,
            ),
            Container(
                height: screenHeight * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 0.188 * screenHeight,
                          width: 0.378 * screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(50, 97, 92, 75),
                                width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(38, 255, 255, 255),
                              foregroundColor:
                                  Color.fromARGB(76, 255, 255, 255),
                              elevation: 0,

                              // minimumSize:
                              //     Size(double.infinity, double.infinity),
                              shape: RoundedRectangleBorder(),
                            ),
                            onPressed: okay,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   height: screenHeight*0.020,

                                // ),
                                Container(
                                  width: screenWidth * 0.16,
                                  height: screenHeight * 0.12,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      "assets/icons/soilinfo.png",
                                    ),
                                    fit: BoxFit.contain,
                                  )),
                                ),
                                Text(
                                  "Soil Info",
                                  style: TextStyle(
                                    fontSize: 16 * textScaleFactor,
                                    color: Color(0xff5C7744),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Outfit",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.188 * screenHeight,
                          width: 0.378 * screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(50, 97, 92, 75),
                                width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(38, 255, 255, 255),
                              foregroundColor:
                                  Color.fromARGB(76, 255, 255, 255),
                              elevation: 0,

                              // minimumSize:
                              //     Size(double.infinity, double.infinity),
                              shape: RoundedRectangleBorder(),
                            ),
                            onPressed: okay,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   height: screenHeight*0.020,

                                // ),
                                Container(
                                  width: screenWidth * 0.16,
                                  height: screenHeight * 0.12,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      "assets/icons/kakaji.png",
                                    ),
                                    fit: BoxFit.contain,
                                  )),
                                ),
                                Text(
                                  "Kaka Ji",
                                  style: TextStyle(
                                    fontSize: 16 * textScaleFactor,
                                    color: Color(0xff5C7744),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Outfit",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 0.188 * screenHeight,
                          width: 0.378 * screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(50, 97, 92, 75),
                                width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(38, 255, 255, 255),
                              foregroundColor:
                                  Color.fromARGB(76, 255, 255, 255),
                              elevation: 0,

                              // minimumSize:
                              //     Size(double.infinity, double.infinity),
                              shape: RoundedRectangleBorder(),
                            ),
                            onPressed: okay,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   height: screenHeight*0.020,

                                // ),
                                Container(
                                  width: screenWidth * 0.16,
                                  height: screenHeight * 0.12,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      "assets/icons/irrigation.png",
                                    ),
                                    fit: BoxFit.contain,
                                  )),
                                ),
                                Text(
                                  "Irrigation",
                                  style: TextStyle(
                                    fontSize: 16 * textScaleFactor,
                                    color: Color(0xff5C7744),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Outfit",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.188 * screenHeight,
                          width: 0.378 * screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(50, 97, 92, 75),
                                width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(38, 255, 255, 255),
                              foregroundColor:
                                  Color.fromARGB(76, 255, 255, 255),
                              elevation: 0,

                              // minimumSize:
                              //     Size(double.infinity, double.infinity),
                              shape: RoundedRectangleBorder(),
                            ),
                            onPressed: okay,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   height: screenHeight*0.020,

                                // ),
                                Container(
                                  width: screenWidth * 0.16,
                                  height: screenHeight * 0.12,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      "assets/icons/faqs.png",
                                    ),
                                    fit: BoxFit.contain,
                                  )),
                                ),
                                Text(
                                  "FAQS",
                                  style: TextStyle(
                                    fontSize: 16 * textScaleFactor,
                                    color: Color(0xff5C7744),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Outfit",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void okay() {}
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
