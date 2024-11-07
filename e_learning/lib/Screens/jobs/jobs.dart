import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/Widgets/custom_divider.dart';
import 'package:e_learning/Widgets/custom_drawer.dart';
import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:e_learning/Widgets/custom_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/bottom_option.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> jobs = [];
  int itemsToShow = 4;
  bool _isPressed = false;
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
            if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
              Navigator.pop(context);
            } else {
              _drawerscaffoldkey.currentState!.openDrawer();
            }
          },
          icon: _isPressed
              ? const Icon(
                  Icons.close,
                  size: 38,
                )
              : const Icon(
                  Icons.list_rounded,
                  size: 38,
                ),
          style: const ButtonStyle(
              overlayColor: WidgetStatePropertyAll(Colors.white)),
        ),
        title: Image.asset(
          'assets/images/logo2.jpg',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: Scaffold(
        key: _drawerscaffoldkey,
        drawer: const Customdrawer(),
        body: jobs.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Explore job Opportunities',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald'
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(CupertinoIcons.briefcase),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: itemsToShow <= jobs.length
                          ? itemsToShow
                          : jobs.length,
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        return Column(
                          children: [
                            Customlisttile(
                              text: job['Title'] ?? 'No Title',
                              data: job['Company'] ?? 'No Company',
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text(job['Title']),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'Company: ${job['Company']}'),
                                                const SizedBox(height: 10),
                                                Text(
                                                    'Location : ${job['Location']}'),
                                                const SizedBox(height: 10),
                                                Text(
                                                    'Description: ${job['Description'] ?? 'No Description'}'),
                                                const SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Customelevatedbutton(
                                                      text: 'Cancel',
                                                      h: 50,
                                                      color: Colors.black,
                                                      OnPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      fontSize: 16,
                                                      w: MediaQuery.of(context).size.width*.3,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Customelevatedbutton(
                                                      text: 'Apply',
                                                      h: 50,
                                                      color: Colors.white,
                                                      OnPressed: () {},
                                                      fontSize: 16,
                                                      bgcolor: Colors.black,
                                                      w: MediaQuery.of(context).size.width*.3,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                            ),
                            const Customdivider(),
                          ],
                        );
                      },
                    ),
                  ),
                  if (itemsToShow < jobs.length)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Customelevatedbutton(
                        OnPressed: () {
                          setState(() {
                            itemsToShow = jobs.length;
                          });
                        },
                        color: Colors.white,
                        h: 50,
                        text: 'View all Opportunities',
                        bgcolor: Colors.black,
                        w: 330,
                        fontSize: 22,
                      ),
                    ),
                ],
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomOption(selectedIndex: 5,),
      ),
    );
  }

  void fetchJobs() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('jobs').get();

      setState(() {
        jobs = querySnapshot.docs.map((doc) {
          print(doc.data());
          return doc.data() as Map<String, dynamic>;
        }).toList();
        jobs = jobs.where((job) => job['Title'] != null).toList();
      });
    } catch (e) {
      print('Error fetching jobs: $e');
      // Handle the error appropriately
    }
  }
}

