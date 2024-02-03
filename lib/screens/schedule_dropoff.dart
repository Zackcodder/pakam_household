import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pakam_household/screens/drop_off_schedule_details.dart';
import 'package:pakam_household/screens/schedule.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class ScheduleDropOffScreen extends StatefulWidget {
  static String id = 'schedule_drop_off_screen';
  const ScheduleDropOffScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleDropOffScreen> createState() => _ScheduleDropOffScreenState();
}

class _ScheduleDropOffScreenState extends State<ScheduleDropOffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Schedule Drop off', style: kScheduleHeader,),

        leading: Container(
          margin: const EdgeInsets.only(left: 5),
          height: 2,
          width: 2,
          child:  Center(
            child: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(onPressed: (){
                  Navigator.pushNamed(context, ScheduleScreen.id);
                }, icon:
                const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: kcIconGrey,
                )),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 23, right: 23, top: 24),
        child: Column(
          children: [
            const Text(
              textAlign: TextAlign.justify,
              "Below are the nearest Drop off locations closest to your",
              style: kSelectWasteHeaderText,
            ),
            const SizedBox(height: 16.0),
            ///list or nearby location
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 12, left: 12),
                color: kcWhite,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DropOffScheduleDetailsScreen.id);
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kcWhite,
                          boxShadow: [
                            BoxShadow(
                              color: kcBoxShadow.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(0, 0), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Lawma Recyclers', style: kScheduleType,),
                                ///Address
                                Row(
                                  children: [
                                    Icon(Icons.location_pin, color: kcGreen, size: 15,),
                                    SizedBox(width: 5,),
                                    Text("3, Olaniyi Stresst, idi Oro, Lagos")
                                  ],
                                ),
                                SizedBox(height: 5,),

                                ///phone number
                                Row(
                                  children: [
                                    Icon(Icons.phone, color: kcGreen, size: 15,),
                                    SizedBox(width: 5,),
                                    Text("0908 790 8769, 0112 789 8789")
                                  ],
                                ),
                                SizedBox(height: 5,),

                                ///time
                                Row(
                                  children: [
                                    Icon(Icons.alarm, color: kcGreen, size: 15,),
                                    SizedBox(width: 5,),
                                    Text("9:00am - 4:00pm")
                                  ],
                                ),
                                SizedBox(height: 5,),

                                ///item
                                Row(
                                  children: [
                                    Icon(Icons.business_center_outlined, color: kcGreen, size: 15,),
                                    SizedBox(width: 5,),
                                    Text("Can, Pet Bottle, Wood, Nylon",style: TextStyle(
                                        color: kcDeepGreen,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Raleway',
                                        fontSize: 11,
                                        fontStyle: FontStyle.normal),)
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],

        ),

      ),
    );
  }
}
