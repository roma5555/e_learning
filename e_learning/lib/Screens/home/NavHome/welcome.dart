import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo2.jpg',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              'Welcome ',
              style: TextStyle(fontFamily: 'Oswald', fontSize: 40),
            ),
            const Spacer(
              flex: 1,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                'Unlock Your Potential For Online Career Growth',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    color: Color(0xFF3e48b2),
                    fontSize: 30),
              ),
              icon: const Icon(Icons.public),
              iconAlignment: IconAlignment.end,
              style: const ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(Colors.white)),
            ),
            const Spacer(
              flex: 1,
            ),
            Customelevatedbutton(
                text: 'Get Started',
                h: 60,
                w: 280,
                color: Colors.black,
                OnPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('CoursesHome', (route) => false);
                },
                fontSize: 30),
            const Spacer(
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}
