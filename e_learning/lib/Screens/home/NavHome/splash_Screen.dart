import 'dart:async';

import 'package:e_learning/Screens/home/NavHome/navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Navigation())));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          const Text(
            'LearnToCareer',
            style: TextStyle(
                fontFamily: 'Oswald', color: Color(0xFF3e48b2), fontSize: 40),
          ),
          const Spacer(
            flex: 1,
          ),
          CircleAvatar(
            minRadius: 50,
            child: Image.asset('assets/images/logo.jpg'),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
