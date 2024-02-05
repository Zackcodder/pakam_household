import 'package:flutter/material.dart';
import 'package:pakam_household/screens/dropoff_loading.dart';
import 'package:pakam_household/screens/schedule_details.dart';
import 'package:pakam_household/screens/schedule_dropoff.dart';
import 'package:pakam_household/screens/schedule_pickup.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class ScheduleScreen extends StatefulWidget {
  static String id = 'schedule_screen';
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Schedule Request',
          style: kScheduleHeader,
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 5),
          height: 2,
          width: 2,
          child: const Center(
            child: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: kcIconGrey,
                ),
              ),
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScheduleDetailsScreen.id);
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: kcBlack,
                  )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 23, right: 23, top: 40),
        child: ListView(
          children: [
            ///pickup
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SchedulePickupScreen.id);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: kcWhite,
                  boxShadow: [
                    BoxShadow(
                      color: kcBoxShadow.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 0), // Offset of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: kcGreen,
                      child: Icon(
                        Icons.local_shipping_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Schedule Pickup', style: kScheduleType),
                        Text('Request for waste pickup at a goal',
                            style: kScheduleTypeSub),
                      ],
                    ),
                    Spacer(), // To push the arrow icon to the right
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),

            ///drop off
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DropOffLoadingScreen.id);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: kcWhite,
                  boxShadow: [
                    BoxShadow(
                      color: kcBoxShadow.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 0), // Offset of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: kcGreen,
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Schedule Drop-off', style: kScheduleType),
                        Text('Request for waste drop-off at a goal',
                            style: kScheduleTypeSub),
                      ],
                    ),
                    Spacer(), // To push the arrow icon to the right
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kcGreen,
        type: BottomNavigationBarType
            .fixed, // Use this if you have more than three items
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pending_actions_sharp),
            label: 'Schedules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Chatroom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
