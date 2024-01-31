import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakam_household/constants/text_style.dart';
import 'package:pakam_household/screens/selected_waste_category.dart';

import '../constants/colors.dart';

class SchedulePickupScreen extends StatefulWidget {
  static String id = 'schedule_pickup_screen';
  const SchedulePickupScreen({Key? key}) : super(key: key);

  @override
  State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {

  //  date
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    )) ??
        DateTime.now();

    if (picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    String formattedDate = _selectedDate != null
        ? DateFormat('MMMM dd, yyyy').format(_selectedDate!)
        : "Select a date";
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Schedule Pickup', style: kScheduleHeader,),

        leading: Container(
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
        margin: const EdgeInsets.only(left: 23, right: 23, top: 24),
        child: ListView(
          children: [

            ///category
            Container(
              margin: const EdgeInsets.only(
                bottom: 40,
              ),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kcGreen, // Set the border color
                  width: 1, // Set the border width
                ),
                borderRadius:
                BorderRadius.circular(8), // Optionally, add rounded corners
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, SelectWasteCategoryScreen.id);
                  // _selectDate(context);
                },
                title: const Text(
                    'Category',
                    style: kSchedulePickupTextField),
                subtitle: const Text(
                    'Select your category',
                    style:kSchedulePickupTextFieldHint),
                trailing: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                ),
              ),
            ),


            ///waste quantity
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Waste Quantity',
                    style: kSchedulePickupTextField,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your waste quantities',
                      border: InputBorder.none,
                      hintStyle: kSchedulePickupTextFieldHint,
                    ),
                    style: const TextStyle(color: kcBlack),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),

            ///schedule date
            Container(
              margin: const EdgeInsets.only(
                bottom: 40,
              ),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kcGreen, // Set the border color
                  width: 1, // Set the border width
                ),
                borderRadius:
                BorderRadius.circular(8), // Optionally, add rounded corners
              ),
              child: ListTile(
                onTap: () {
                  _selectDate(context);
                },
                title: const Text(
                    'Schedule Date',
                    style: kSchedulePickupTextField),
                subtitle: Text(
                    formattedDate,
                    style:kSchedulePickupTextFieldHint),
              ),
            ),

            ///pickup location
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pickup Location',
                        style: kSchedulePickupTextField,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your pickup location',
                          border: InputBorder.none,
                          hintStyle: kSchedulePickupTextFieldHint,
                        ),
                        style: const TextStyle(color: kcBlack),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                /// Checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        // Handle checkbox state change
                      },
                    ),
                    const Text('Use my current location'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Additional information text
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "We've added a 10% fee to your waste schedule for \n your convenience",
                  style: kScheduleType,),
                ),
              ],
            ),

            ///continue button
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, AddContactSuccessPage.id);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    color: kcGreen,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kcWhite),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
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
        ),
      ),
    );
  }
}
