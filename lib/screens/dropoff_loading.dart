import 'package:flutter/material.dart';
import 'package:pakam_household/constants/colors.dart';
import 'package:pakam_household/screens/schedule_dropoff.dart';

class DropOffLoadingScreen extends StatefulWidget {
  static String id = 'drop_off_loading_screen';
  const DropOffLoadingScreen({Key? key}) : super(key: key);

  @override
  State<DropOffLoadingScreen> createState() => _DropOffLoadingScreenState();
}

class _DropOffLoadingScreenState extends State<DropOffLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, ScheduleDropOffScreen.id);
    });
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(left: 70, right: 50, top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/scanning.png'),
              const Text('Scanning for nearby recycling company...', style:  TextStyle(
                color: kcGreyscale,
                fontWeight: FontWeight.w400,
                fontFamily: 'Raleway',
                fontSize: 10,
                fontStyle: FontStyle.normal),)
          ],
        ),
      ),
    );
  }
}
