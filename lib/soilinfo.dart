import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SoilInfo extends StatefulWidget {
  const SoilInfo({super.key});

  @override
  State<SoilInfo> createState() => _SoilInfoState();
}

class _SoilInfoState extends State<SoilInfo> {
  Map<String, dynamic>? soilData;
  bool isLoading = true; // Initially true to show the loading spinner

  @override
  void initState() {
    super.initState();
    // Start reading data as soon as the widget is initialized
    readData();
  }

  // Function to continuously listen for data changes from Firebase
  void readData() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

    // Listen to data changes in real-time
    ref.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          soilData = data.map((key, value) => MapEntry(key.toString(), value));
          isLoading = false; // Data has been loaded, stop the loading spinner
        });
      } else {
        setState(() {
          soilData = null; // Set null if no data is available
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double textScaleFactor = ScaleSize.textScaleFactor(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Information'),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Loading indicator while fetching data
              if (isLoading) CircularProgressIndicator(),

              // Show data in different boxes when available
              if (soilData != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoBox("Heat Index",
                          soilData!['heatindex'].toString(), screenWidth),
                      SizedBox(height: 20),
                      _buildInfoBox("Humidity",
                          soilData!['humidity'].toString(), screenWidth),
                      SizedBox(height: 20),
                      _buildInfoBox("Moisture",
                          soilData!['mositure'].toString(), screenWidth),
                      SizedBox(height: 20),
                      _buildInfoBox("Temperature", soilData!['temp'].toString(),
                          screenWidth),
                    ],
                  ),
                ),

              // Show message if no data is available
              if (soilData == null && !isLoading)
                Text(
                  "No data available",
                  style: TextStyle(
                    fontSize: textScaleFactor * 18,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build individual information boxes
  Widget _buildInfoBox(String title, String value, double width) {
    return Container(
      width: width * 0.8,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
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
