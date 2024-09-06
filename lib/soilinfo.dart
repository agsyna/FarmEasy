import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SoilInfo extends StatefulWidget {
  const SoilInfo({super.key});

  @override
  State<SoilInfo> createState() => _SoilInfoState();
}

void readData() {
  print("check1");
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
  print(ref);
  ref.onValue.listen((DatabaseEvent event) {
    if (event.snapshot.exists) {
      print("check2");
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      print("data : $data");
    } else {
      print("No data available.");
    }
  });
}

void writeData() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
  print("check3");

  await ref.set({
    "heatindex": 23,
    "humidity": 18,
    "mositure": 23,
    "temp": 45,
  });
}

TextEditingController _soilinfo = TextEditingController();

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class _SoilInfoState extends State<SoilInfo> {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textScaleFactor = ScaleSize.textScaleFactor(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
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
              SizedBox(
                height: 0.21 * screenHeight,
              ),
              Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.48,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(140, 217, 217, 217),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.03 * screenHeight,
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                      ),
                      Text(
                        "FARMEASY",
                        style: TextStyle(
                          fontFamily: "Impact",
                          fontSize: textScaleFactor * 12,
                          // fontWeight:FontWeight.w900,
                          color: Color(0xffF5F5F5),
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: 0.025 * screenHeight,
                      ),
                      SingleChildScrollView(
                        child: Container(
                          width: screenWidth * 0.8,
                          child: TextField(
                            maxLength: 100,
                            controller: _soilinfo,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(127, 75, 97, 79),
                                fontSize: 19.0 * textScaleFactor,
                                fontFamily: "Outfit",
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0,
                              ),
                              counterText: '',
                              suffixIcon: Icon(
                                Icons.mail_outline_outlined,
                                color: Color.fromARGB(127, 75, 97, 79),
                                size: 25.0 * textScaleFactor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(127, 75, 97, 79),
                                    width: 2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(127, 75, 97, 79),
                                    width: 2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 25.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.02 * screenHeight,
                      ),
                      Container(
                        width: screenWidth * 0.8,
                        child: TextField(
                          maxLength: 100,
                          obscureText: true,
                          controller: _soilinfo,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(127, 75, 97, 79),
                              fontSize: 19.0 * textScaleFactor,
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0,
                            ),
                            counterText: '',
                            suffixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Color.fromARGB(127, 75, 97, 79),
                              size: 25.0 * textScaleFactor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(127, 75, 97, 79),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(127, 75, 97, 79),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 25.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.03 * screenHeight,
                      ),
                      Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0xff5C7744),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                // writeData();
                                readData();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                // backgroundColor: Color.fromARGB(255, 48, 62, 35),
                                backgroundColor:
                                    Color.fromARGB(255, 75, 97, 79),
                                foregroundColor:
                                    Color.fromARGB(255, 75, 97, 79),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: textScaleFactor * 20,
                                  color: Color(0xffE3EBDE),
                                ),
                              ))),
                    ],
                  )),
              SizedBox(height: screenHeight * 0.04),
              Image(
                image: AssetImage(
                  "assets/images/loginfarmer2.png",
                ),
                width: screenWidth,
                height: 208,
              ),
            ],
          ),
        ),
      ),
    );
  }

  okay() {
    print("okays");
  }
}
