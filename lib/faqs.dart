import 'dart:math';

import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    double textScaleFactor = ScaleSize.textScaleFactor(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.search,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // FAQ image at the top
          Container(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/faqs.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.blueAccent,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Frequently Asked Questions',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  title: Text(
                    'How to use this app?',
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      fontSize: textScaleFactor * 13,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'You can use this app for multiple tasks such as interacting with the chatbot "Kaka Ji," which assists with agricultural queries and hardware operations. Additionally, you can monitor soil information and manage the irrigation system by simply clicking the respective icons on the homepage.',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          fontSize: textScaleFactor * 13,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'How to change the interface language?',
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      fontSize: textScaleFactor * 13,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'We are currently working on implementing language change options. This feature will be available soon.',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          fontSize: textScaleFactor * 13,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'How to use the chatbot?',
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      fontSize: textScaleFactor * 13,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'To use our chatbot "Kaka Ji," click on its icon. A text box will appear where you can type your query, and the chatbot will provide you with an appropriate response.',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          fontSize: textScaleFactor * 13,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'How do I log out?',
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      fontSize: textScaleFactor * 13,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'To log out, open the app menu, navigate to the settings or profile section, and select "Log Out."',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          fontSize: textScaleFactor * 13,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'How do I change my profile information?',
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      fontSize: textScaleFactor * 13,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'Go to your profile, click "Edit Profile," and update your personal information such as name, email, and profile picture.',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          fontSize: textScaleFactor * 13,
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'How do I contact customer support?',
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.w400,
                      fontSize: textScaleFactor * 13,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        'You can contact customer support through the "Help & Support" section in the app, where you\'ll find options for email, live chat, or phone support.',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          fontSize: textScaleFactor * 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
