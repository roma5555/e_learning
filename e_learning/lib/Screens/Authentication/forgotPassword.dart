import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:e_learning/Widgets/textField.dart';
import 'package:e_learning/helper/showSnackbar.dart';
import 'package:flutter/material.dart';

import '../../helper/AuthServices.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Image.asset(
          'assets/images/logo2.jpg',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: Form(
        key: _formKey,
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(
              flex: 2,
            ),
            const Text(
              'Forgot Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 1,
            ),
            textfield(
              w: 330,
              text: 'Email',
              controller: emailController,
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is required';
                }
                return null;
              },
            ),
            const Spacer(
              flex: 1,
            ),
            Customelevatedbutton(
              text: 'Reset Password',
              h: 50,
              w: 310,
              color: Colors.white,
              OnPressed: () {
                if(_formKey.currentState!.validate()){
                  try {
                    _authService.sendPasswordResetEmail(emailController.text);
                    showSnackbar(context, 'Link has been sent to your email for password reset');
                  } on Exception catch (e) {
                    print(e);
                  }
                }
                Navigator.pushNamed(context,'LoginPage');
              },
              fontSize: 24,
              bgcolor: Colors.black,
            ),

            const Spacer(
              flex: 8,
            ),
          ],
        ),
      )),
    );
  }

}
