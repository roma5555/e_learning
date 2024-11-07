import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:e_learning/helper/AuthServices.dart';
import 'package:e_learning/helper/showSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  bool _loading =false;
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
      body: ModalProgressHUD(

        inAsyncCall: _loading,
        child: Center(
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                'LearnToCareer',
                style: TextStyle(
                    fontFamily: 'Oswald', color: Color(0xFF3e48b2), fontSize: 40),
              ),
              const Spacer(
                flex: 1,
              ),
              Customelevatedbutton(
                w: 280,
                h: 50,
                color: Colors.white,
                text: ' SIGN UP ?',
                bgcolor: const Color(0xFF3e48b2),
                OnPressed: () {
                  Navigator.pushNamed(context, 'SignupPage');
                },
                fontSize: 20,
              ),
              const Spacer(
                flex: 1,
              ),
              Customelevatedbutton(
                w: 280,
                h: 50,
                color: Colors.black,
                text: ' SIGN IN ?',
                OnPressed: () {
                  Navigator.pushNamed(context, 'LoginPage');
                },
                fontSize: 20,
              ),
              const Spacer(
                flex: 1,
              ),
              Customelevatedbutton(
                w: 330,
                h: 50,
                color: Colors.black,
                text: ' Sign in with Google ?',
                icon: Icons.g_mobiledata_rounded,
                OnPressed: () async {
                  setState(() {
                    _loading=true;
                  });

                  try {
                   User? user= await AuthService().signInWithGoogle();
                    if (user != null) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('CoursesHome', (route) => false);
                      showSnackbar(context, 'Welcome back, ${user.displayName}');
                    }
                  } catch (e) {
                    print(e.toString());
                    }
                  setState(() {
                    _loading=false;
                  });
                },
                fontSize: 17,
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
