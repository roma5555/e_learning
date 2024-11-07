import 'package:flutter/material.dart';

import '../../Widgets/custom_appbar.dart';

class PrivacyPolicies extends StatelessWidget {
  const PrivacyPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Appbar(title: 'Privacy policies')),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '1. Information We Collect',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),

            Text(
                'We collect different types of information to provide and improve our service:'),
            SizedBox(height: 40,),
            Text(
              'A. Personal Information:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),

            Text(
                'When you sign up, create an account, or interact with our app, we may collect the following personal information:'
                'Name: To address you properly.'
                'Email Address: To communicate with you, send updates, and respond to inquiries.'
                'Phone Number (if applicable): For account recovery or communication.'
                'Billing Information (if applicable): For payments, including credit card details, which are securely processed by third-party providers'),
            SizedBox(height: 40,),

            Text(
              'B. Usage Data',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),

            Text(
                'We collect certain information automatically when you use the app:'
                'Device Information: Information about the device you use to access the app (e.g., operating system, device model, unique device identifiers).'
                'Log Data: Details about your interactions with the app, such as access times, page views, and the features you use.'
                'Cookies and Tracking Technologies: We may use cookies, web beacons, and similar technologies to enhance user experience and analyze usage patterns.'),
          ],
        )));
  }
}
