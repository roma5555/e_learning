import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/Widgets/custom_appbar.dart';
import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../Widgets/passwordField.dart';
import '../../helper/AuthServices.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final AuthService _authService = AuthService();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var emailController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar(
            title: 'Edit Profile',
          )),
      body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Edit your account settings and change your password here.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
                passwordField(
                  controller: newPasswordController,
                  text: 'New Password',
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
                    if (value != newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Customelevatedbutton(
                    text: 'Change Password',
                    h: 50,
                    color: Colors.white,
                    bgcolor: Colors.black,
                    OnPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                         _authService.changePassword(newPasswordController.text);
                          await AuthService().updateUser(newPasswordController.text);
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * .4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.verified_outlined,
                                      size: 60,
                                      color: Color(0xFF3e48b2),
                                    ),
                                    const Text(
                                        'Password changed successfully !'),
                                    Customelevatedbutton(
                                        text: 'Ok',
                                        h: 50,
                                        color: Colors.white,
                                        bgcolor: Colors.black,
                                        OnPressed: () {
                                          Navigator.pop(context);
                                        },
                                        fontSize: 20)
                                  ],
                                ),
                              ),
                            ),
                          );
                        } on Exception catch (e) {
                          print(e);
                        }
                      }
                    },
                    fontSize: 26)
              ],
            ),
          )),
    );
  }
}
