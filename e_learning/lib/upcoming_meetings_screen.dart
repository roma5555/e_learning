import 'package:e_learning/Widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Widgets/custom_elevated_button.dart';
import 'shared/components/bottom_option.dart';



class UpcomingMeetingsScreen extends StatefulWidget {
  @override
  State<UpcomingMeetingsScreen> createState() => _UpcomingMeetingsScreenState();
}

class _UpcomingMeetingsScreenState extends State<UpcomingMeetingsScreen> {
  bool _isPressed = false;
  int itemsToShow = 2;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  GlobalKey<ScaffoldState>();

  Stream<QuerySnapshot> getMeetings() {
    return FirebaseFirestore.instance.collection('meetings').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

      ),

      body: Scaffold(
        drawer: const Customdrawer(),
        key: _drawerscaffoldkey,
        body: StreamBuilder<QuerySnapshot>(
          stream: getMeetings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No meetings found.'));
            }

            var meetings = snapshot.data!.docs;

            return Column(
              children: [
                const Text('Upcoming Meetings', style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald'
                ),),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: itemsToShow <= meetings.length
                        ? itemsToShow
                        : meetings.length,
                    itemBuilder: (context, index) {
                      var meeting = meetings[index];
                      return MeetingCard(
                        title: meeting['title'] ?? 'No Title',
                        date: meeting['date'] ?? 'No Date',
                        time: meeting['time'] ?? 'No Time',
                        location: meeting['location'] ?? 'No Location',
                        link: meeting['link'] ?? '',
                      );
                    },
                  ),
                ),
                if (itemsToShow < meetings.length)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Customelevatedbutton(
                      OnPressed: () {
                        setState(() {
                          itemsToShow = meetings.length;
                        });
                      },
                      color: Colors.white,
                      h: 50,
                      text: 'View all Meetings',
                      bgcolor: Colors.black,
                      w: 330,
                      fontSize: 22,
                    ),
                  ),
              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomOption(selectedIndex: 4,),
      ),
    );
  }
}

class MeetingCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String link;

  MeetingCard({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(date, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text(time, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text(location, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 8.0),
            Customelevatedbutton(text: 'Join $location', h: 50, color: Colors.white,OnPressed: () {
              launchURL(link);
            }, fontSize: 20,bgcolor: Colors.black,),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class AllMeetingsScreen extends StatelessWidget {
  Stream<QuerySnapshot> getAllMeetings() {
    return FirebaseFirestore.instance.collection('meetings').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Meetings'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getAllMeetings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No meetings found.'));
          }

          var meetings = snapshot.data!.docs;

          return ListView.builder(
            itemCount: meetings.length,
            itemBuilder: (context, index) {
              var meeting = meetings[index];
              return MeetingCard(
                title: meeting['title'] ?? 'No Title',
                date: meeting['date'] ?? 'No Date',
                time: meeting['time'] ?? 'No Time',
                location: meeting['location'] ?? 'No Location',
                link: meeting['link'] ?? '',
              );
            },
          );
        },
      ),
    );
  }
}
