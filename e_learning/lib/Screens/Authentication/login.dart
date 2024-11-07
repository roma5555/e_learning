import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:e_learning/Widgets/passwordField.dart';
import 'package:e_learning/Widgets/textField.dart';
import 'package:e_learning/helper/AuthServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../helper/showSnackbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
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
            icon: const Icon(Icons.arrow_back_ios)),
        title: Image.asset(
          'assets/images/logo2.jpg',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        color: const Color(0xFF3e48b2),
        child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
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
                  const SizedBox(
                    height: 20,
                  ),
                  passwordField(
                    text: 'Password',
                    controller: passwordController,
                    icon: Icons.key_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Customelevatedbutton(
                    text: 'Login',
                    h: 50,
                    w: 310,
                    color: Colors.white,
                    OnPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _loading = true;
                        });
                        try {
                          await _authService.loginUser(
                              emailController.text, passwordController.text);
                          await _authService.getUserEmail();

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'CoursesHome', (route) => false);
                          if (_authService.fullname!.isNotEmpty) {
                            showSnackbar(context,
                                'Welcome back ${_authService.fullname}');
                          } else {
                            showSnackbar(context, 'Welcome back');
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackbar(
                                context, 'No user found for that email');
                          } else if (e.code == 'wrong-password') {
                            showSnackbar(context, 'Invalid email or password.');
                          }
                          else{
                            showSnackbar(context, 'Invalid information');

                          }
                        }
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
                    bgcolor: Colors.black,
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'ForgotPassword');
                    },
                    style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Colors.white)),
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
