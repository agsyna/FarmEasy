import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:smart_irrigation/const.dart';
import 'package:weather/weather.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;
  late String _currentTime;
  final WeatherFactory wf = WeatherFactory(API_KEY);
  Weather? _weather;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  Widget customButton({
    required VoidCallback onPressed,
    required String imagePath,
    required String buttonText,
    required double screenHeight,
    required double screenWidth,
    required double textScaleFactor,
  }) {
    return Container(
      height: 0.168 * screenHeight,
      width: 0.378 * screenWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(50, 97, 92, 75),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(38, 255, 255, 255),
          foregroundColor: const Color.fromARGB(76, 255, 255, 255),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                20), // Ensure the button shape matches the container
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.16,
              height: screenHeight * 0.12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 16 * textScaleFactor,
                color: const Color(0xff5C7744),
                fontWeight: FontWeight.w700,
                fontFamily: "Outfit",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    wf.currentWeatherByLocation(3.457523, 77.026344).then((w) {
      setState(() {
        _weather = w;
        DateTime _currentTime = DateTime.now();
      });
    });
  }

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
              height: screenHeight * 0.048,
            ),
            GestureDetector(
              onTap: okay,
              child: Container(
                  height: screenHeight * 0.24,
                  width: screenWidth * 0.88,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      const Color.fromRGBO(176, 190, 197, 1),
                      const Color.fromARGB(255, 135, 161, 173),
                      const Color.fromARGB(255, 121, 125, 153),
                    ], stops: [
                      0,
                      50,
                      75
                    ]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEATHER STATION',
                              style: TextStyle(
                                color: Color(0xFF7A7B7A),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            // Text(_weather?.areaName ?? "",
                            //     style: TextStyle(
                            //       color: Color(0xFF515251),
                            //       fontSize: 16,
                            //     )),
                            // _location(),
                            Text("Gurugram",
                                style: TextStyle(
                                  color: Color(0xFF515251),
                                  fontSize: 16,
                                )),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                weather_icon(_weather!.weatherConditionCode!)
                              ],
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        width: 40,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _datetimeInfo(),
                            SizedBox(height: 4),
                            Text(
                              _weather?.weatherDescription ?? "",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${_weather?.temperature?.fahrenheit?.toStringAsFixed(1)}°F",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
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
                        customButton(
                            onPressed: () {},
                            imagePath: "assets/icons/soilinfo.png",
                            buttonText: "Soil Info",
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            textScaleFactor: textScaleFactor),
                        customButton(
                            onPressed: () {},
                            imagePath: "assets/icons/kakaji.png",
                            buttonText: "Kaka Ji",
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            textScaleFactor: textScaleFactor),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customButton(
                            onPressed: () {},
                            imagePath: "assets/icons/irrigation.png",
                            buttonText: "Irrigation",
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            textScaleFactor: textScaleFactor),
                        customButton(
                            onPressed: () {},
                            imagePath: "assets/icons/faqs.png",
                            buttonText: "FAQS",
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            textScaleFactor: textScaleFactor),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void okay() {
    print("okay");
  }

  Widget _location() {
    return Text(_weather?.areaName ?? "",
        style: TextStyle(
          color: Color(0xFF515251),
          fontSize: 16,
        ));
  }

  Widget _datetimeInfo() {
    DateTime now = _weather?.date ?? DateTime.now();
    return Text(DateFormat("EEEE").format(now),
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ));
  }

  Widget weather_icon(int code) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if (code > 200 && code <= 300) {
      return Image.asset(
        'assets/weather_images/thunder_storm.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else if (code > 300 && code <= 400) {
      return Image.asset(
        'assets/weather_images/drizzling.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else if (code > 500 && code <= 600) {
      return Image.asset(
        'assets/weather_images/raining.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else if (code > 700 && code < 800) {
      return Image.asset(
        'assets/weather_images/mist.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else if (code == 800) {
      return Image.asset(
        'assets/weather_images/sunny.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else if (code > 800 && code <= 884) {
      return Image.asset(
        'assets/weather_images/cloudy.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else if (code == 800 && int.parse(_currentTime) > 18) {
      return Image.asset(
        'assets/weather_images/sunny.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else if (code > 800 && code <= 884 && int.parse(_currentTime) > 18) {
      return Image.asset(
        'assets/weather_images/cloudy.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    } else {
      return Image.asset(
        'assets/weather_images/cloudy.png', // replace with your asset path
        width: screenWidth * 0.3,
        height: screenHeight * 0.12,
      );
    }
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
