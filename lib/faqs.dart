import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
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
                  title: Text('How to use this app?'),
                  subtitle: Text('5 minutes ago'),
                  children: [
                    ListTile(
                      title: Text(
                        'You can use this app for multiple tasks such as interacting with the chatbot "Kaka Ji," which assists with agricultural queries and hardware operations. Additionally, you can monitor soil information and manage the irrigation system by simply clicking the respective icons on the homepage.',
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('How to change the interface language?'),
                  subtitle: Text('10 minutes ago'),
                  children: [
                    ListTile(
                      title: Text(
                        'We are currently working on implementing language change options. This feature will be available soon.',
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('How to use the chatbot?'),
                  subtitle: Text('15 minutes ago'),
                  children: [
                    ListTile(
                      title: Text(
                        'To use our chatbot "Kaka Ji," click on its icon. A text box will appear where you can type your query, and the chatbot will provide you with an appropriate response.',
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('How do I log out?'),
                  subtitle: Text('20 minutes ago'),
                  children: [
                    ListTile(
                      title: Text(
                        'To log out, open the app menu, navigate to the settings or profile section, and select "Log Out."',
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('How do I change my profile information?'),
                  subtitle: Text('25 minutes ago'),
                  children: [
                    ListTile(
                      title: Text(
                        'Go to your profile, click "Edit Profile," and update your personal information such as name, email, and profile picture.',
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('How do I contact customer support?'),
                  subtitle: Text('30 minutes ago'),
                  children: [
                    ListTile(
                      title: Text(
                        'You can contact customer support through the "Help & Support" section in the app, where you\'ll find options for email, live chat, or phone support.',
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
