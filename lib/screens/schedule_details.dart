import 'package:flutter/material.dart';
import 'package:pakam_household/screens/schedule.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class ScheduleDetailsScreen extends StatelessWidget {
  static String id = 'schedule_details_screen';
  const ScheduleDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Schedule Details',
          style: kScheduleHeader,
        ),
        leading:  Container(
          margin: const EdgeInsets.only(left: 5),
          height: 2,
          width: 2,
          child:  Center(
            child: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
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
        margin: const EdgeInsets.only(left: 23, right: 23, top: 40),
        child: ListView(
          children: [
            ///schedule details
            Container(
              margin: const EdgeInsets.only(bottom: 23),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///header
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.add),
                      Text('Schedule Details', style: kScheduleType),
                    ],
                  ),

                  ///waste category
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Waste category', style: kScheduleDetailsText),
                        Text('Can, Pet Bottle',
                            style: kScheduleDetailsItemText),
                      ],
                    ),
                  ),

                  ///waste quantity
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Waste quantity', style: kScheduleDetailsText),
                        Text('1 - 5 kg', style: kScheduleDetailsItemText),
                      ],
                    ),
                  ),

                  ///schedule date
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Scheduled date', style: kScheduleDetailsText),
                        Text('Feb 3rd, 2024', style: kScheduleDetailsItemText),
                      ],
                    ),
                  ),

                  ///pickup
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pickup location', style: kScheduleDetailsText),
                        Text('Can, Pet Bottle',
                            style: kScheduleDetailsItemText),
                      ],
                    ),
                  ),

                  ///reminder date
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reminder date', style: kScheduleDetailsText),
                        Text('Feb 12th, 2024', style: kScheduleDetailsItemText),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///schedule status
            Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///header
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.add),
                      Text('Schedule Status', style: kScheduleType),
                    ],
                  ),

                  ///status
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status', style: kScheduleDetailsText),
                        Row(
                          children: [
                            Icon(Icons.radio_button_checked, color: Colors.red, size: 15,),
                            Text('Pending', style: kScheduleDetailsItemText),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///Accepted by
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Accepted by', style: kScheduleDetailsText),
                        Text('Peteru Daniel', style: kScheduleDetailsItemText),
                      ],
                    ),
                  ),

                  ///Recycling company
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recycling company', style: kScheduleDetailsText),
                        Text('Westman Collections',
                            style: kScheduleDetailsItemText),
                      ],
                    ),
                  ),

                  ///phone number
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Phone Number', style: kScheduleDetailsText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             CircleAvatar(
                              radius: 15,
                              backgroundColor: kcGreyscale.withOpacity(0.4),
                                child: const Icon(
                              Icons.chat,
                              color: kcWhite,
                                  size: 15,
                            )),
                            const SizedBox(width: 5,),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: kcGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.phone,
                                color: kcWhite,
                                size: 15,
                              ),
                            ),

                            const SizedBox(width: 5,),
                            const Text('08094567891',
                                style: kScheduleDetailsItemText),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///delete and missed button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///delete
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 20,),
                      padding: const EdgeInsets.all(10),
                      height: 45,
                      width: 133,
                      decoration: BoxDecoration(
                        color: kcWhite,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kcDeepGreen),
                      ),
                      child: const Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kcGreen,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      )),
                ),

                ///missed
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 20,),
                      padding: const EdgeInsets.all(10),
                      height: 45,
                      width: 133,
                      decoration: BoxDecoration(
                        color: kcDeepGreen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kcWhite),
                      ),
                      child: const Center(
                        child: Text(
                          'Missed',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kcWhite,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
