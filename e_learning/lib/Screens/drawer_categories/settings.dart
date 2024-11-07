import 'package:e_learning/Widgets/custom_appbar.dart';
import 'package:e_learning/Widgets/custom_divider.dart';
import 'package:e_learning/Widgets/custom_list_tile.dart';
import 'package:e_learning/helper/showSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Widgets/custom_elevated_button.dart';
import '../../helper/AuthServices.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar(title: 'Settings')),
      body: Column(
        children: [
          Customlisttile(
            text: 'Privacy Policies',
            onTap: () {
              Navigator.pushNamed(context, 'PrivacyPolicies');
            },
            icon: Icons.lock,
          ),
          const Customdivider(),
          Customlisttile(
            text: 'Delete account',
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
                          'Delete Account?',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Are you sure want to Delete this account ?',
                          style: TextStyle(fontSize: 16),
                        ),
                        Customelevatedbutton(
                            text: 'Delete',
                            h: 50,
                            color: Colors.white,
                            bgcolor: Colors.black,
                            OnPressed: () async {
                              try {

                                await AuthService().deleteUser();
                                await FirebaseAuth.instance.currentUser?.delete();
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    'NavigatorPage',
                                        (route) => false,
                                  );
                                  showSnackbar(context, 'Account deleted successfully!');

                              } on Exception catch (e) {
                                    print(e);
                              }
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
            icon: Icons.delete,
          ),
        ],
      ),
    );
  }
}
