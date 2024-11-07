import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helper/showSnackbar.dart';
import 'custom_divider.dart';
import 'custom_list_tile.dart';

class Customdrawer extends StatefulWidget {
  const Customdrawer({super.key});

  @override
  State<Customdrawer> createState() => _CustomdrawerState();
}

class _CustomdrawerState extends State<Customdrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Drawer(
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            borderSide: BorderSide(color: Colors.black12, width: 1)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Text(
              'Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Customlisttile(
              text: 'Profile Settings',
              icon: Icons.person,
              onTap: () {
                Navigator.pushNamed(context, 'EditProfile');
              },
            ),
            const Customdivider(),
            Customlisttile(
              text: 'Settings',
              icon: Icons.settings,
              onTap: () {
                Navigator.pushNamed(context, 'Settings');
              },
            ),
            const Customdivider(),
            Customlisttile(
              text: 'About',
              icon: Icons.info_outline,
              onTap: () {
                Navigator.pushNamed(context, 'About');
              },
            ),
            const Customdivider(),
            Customlisttile(
              text: ' Logout',
              icon: Icons.logout,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Logout Account?',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Are you sure want to logout this account ?',
                            style: TextStyle(fontSize: 16),
                          ),
                          Customelevatedbutton(
                              text: 'Logout',
                              h: 50,
                              color: Colors.white,
                              bgcolor: Colors.black,
                              OnPressed: () {
                                _signOut().then((value) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    'NavigatorPage',
                                    (route) => false,
                                  );
                                }).catchError((error) {
                                  showSnackbar(
                                      context, 'Sign out failed: $error');
                                });
                              },
                              fontSize: 30),
                          Customelevatedbutton(
                              text: 'Cancel',
                              h: 50,
                              color: Colors.black,
                              OnPressed: () {
                                Navigator.pop(context);
                              },
                              fontSize: 30),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        if (user.providerData
            .any((provider) => provider.providerId == 'google.com')) {
          await _googleSignIn.signOut();
        }
        await _auth.signOut();
      }
    } catch (error) {
      showSnackbar(context, 'Sign out failed: $error');
    }
  }
}
