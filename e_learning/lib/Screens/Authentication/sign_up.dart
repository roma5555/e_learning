import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:e_learning/Widgets/passwordField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Widgets/textField.dart';
import '../../helper/showSnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 import '../../helper/AuthServices.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var fNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _saving = false;
  late String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  const Icon(Icons.arrow_back_ios)),
        title: Image.asset(
          'assets/images/logo2.jpg',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: ModalProgressHUD(
        color: const Color(0xFF3e48b2),
        inAsyncCall: _saving,
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Sign UP',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Create an account',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textfield(
                      w: 330,
                      text: 'Full Name',
                      controller: fNameController,
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textfield(
                      w: 330,
                      controller: emailController,
                      text: 'Email',
                      icon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required';
                        } else if (!value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField(
                      controller: passController,
                      text: 'Password',
                      icon: Icons.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required';
                        } else if (value.length < 8) {
                          return 'password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField(
                      controller: confirmPassController,
                      text: 'Confirm Password',
                      icon: Icons.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is required';
                        }
                        if (value != passController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Customelevatedbutton(
                      text: 'Sign Up',
                      h: 50,
                      w: 310,
                      color: Colors.white,
                      OnPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _saving = true;
                          setState(() {});
                          try {

                            await AuthService().signUp(emailController.text,confirmPassController.text,fNameController.text);

                            String username = fNameController.text;

                            Navigator.pushNamedAndRemoveUntil(
                                context, 'WelcomeScreen', (route) => false);
                            showSnackbar(
                                context, 'Success , Welcome $username');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              showSnackbar(context,
                                  'The account already exists for that email.');
                            }
                          }
                          _saving = false;
                          setState(() {});
                        }
                      },
                      fontSize: 30,
                      bgcolor: Colors.black,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }




}
