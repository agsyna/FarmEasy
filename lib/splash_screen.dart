import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_irrigation/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const mainPage())));

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textScaleFactor = ScaleSize.textScaleFactor(context);
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff9FC784),
            Color(0xff599522),
          ],
          stops: [0, 90],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.3 * screenHeight,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.2,
                    ),
                    Text(
                      "FARMEASY",
                      style: TextStyle(
                        fontFamily: "Impact",
                        fontSize: textScaleFactor * 40,
                        // fontWeight:FontWeight.w900,
                        color: Color(0xffF5F5F5),
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      "Farming Made Easy",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: textScaleFactor * 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff599522),
                        // color: Colors.white
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                alignment: Alignment.bottomCenter,
                image: const AssetImage(
                  "assets/images/splashplants.png",
                ),
                width: screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
