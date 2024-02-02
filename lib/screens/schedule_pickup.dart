import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pakam_household/constants/text_style.dart';
import 'package:pakam_household/screens/schedule_details.dart';
import 'package:pakam_household/screens/selected_waste_category.dart';

import '../constants/colors.dart';

class SchedulePickupScreen extends StatefulWidget {
  static String id = 'schedule_pickup_screen';
  const SchedulePickupScreen({Key? key}) : super(key: key);

  @override
  State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool isCheckboxChecked = false;

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

  ///success dialogue
  _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Image.asset(
                  'assets/success_animation.gif', // Replace with your success animation image
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Submitted Successfully!',
                  style: TextStyle(
                      color: kcDeepGreen,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Your pickup request has been sent.',
                  style: TextStyle(
                      color: kcIconGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                      fontSize: 13,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _navigateToScheduleDetails();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///confirmation sheet
  _showConfirmationSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisSize: MainAxisSize.min,
              children: [
                ///header and cancel button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Schedule Pickup',
                      style: kBottomSheetHeaderText,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Icon(
                        Icons.cancel,
                        color: kcSelectedItemColor.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: kcWhite,
                    borderRadius: BorderRadius.circular(
                        13), // Optionally, add rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///category
                      Row(
                        children: [
                          const Text(
                            'Category:  ',
                            style: kBottomSheetHeaderBodyText,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kcIconGrey,
                              borderRadius: BorderRadius.circular(
                                  50), // Optionally, add rounded corners
                            ),
                            child: const Center(
                              child: Text(
                                'Can',
                                style: TextStyle(
                                    color: kcWhite,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Raleway',
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kcIconGrey,
                              borderRadius: BorderRadius.circular(
                                  50), // Optionally, add rounded corners
                            ),
                            child: const Center(
                              child: Text(
                                'Pet Bottle',
                                style: TextStyle(
                                    color: kcWhite,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Raleway',
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      ///waste quantity
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Waste Quantity:  ',
                              style: kBottomSheetHeaderBodyText,
                            ),
                            TextSpan(
                              text: _locationController.text,
                              style: kBottomSheetHeaderBodyValueText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      ///schedule date
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Schedule Date:  ',
                              style: kBottomSheetHeaderBodyText,
                            ),
                            TextSpan(
                              text:
                                  '${_selectedDate != null ? DateFormat('MMMM dd, yyyy').format(_selectedDate!) : "Not selected"}',
                              style: kBottomSheetHeaderBodyValueText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),

                      ///pickup location
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Pickup Location:  ',
                              style: kBottomSheetHeaderBodyText,
                            ),
                            TextSpan(
                              text: _locationController.text,
                              style: kBottomSheetHeaderBodyValueText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheckboxChecked = !isCheckboxChecked;
                        });
                      },
                      icon: Icon(
                        isCheckboxChecked
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: isCheckboxChecked ? kcDeepGreen : kcGreyscale,
                      ),
                    ),
                    const Text(
                      'Call me on arrival',
                      style: kScheduleHeader,
                    ),
                  ],
                ),

                ///confirm button
                GestureDetector(
                  onTap: () {
                    _showSubmittingDialog;
                    // Implement your logic to confirm the request
                    Navigator.pop(context);
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
                          'Confirm Request',
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
          );
        });
      },
    );
  }

  ///submitting request
  _showSubmittingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  color: kcDeepGreen,
                  strokeWidth: 2,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Submitting Request',
                  style: TextStyle(
                      color: kcDeepGreen,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
                ///cancel request button
                GestureDetector(
                  onTap: () {
                    // Implement your logic to confirm the request
                    Navigator.pop(context);
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
                          'Confirm Request',
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
      },
    );
  }

  void _navigateToScheduleDetails() {
    Navigator.pushNamed(context, ScheduleDetailsScreen.id);
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
        title: const Text(
          'Schedule Pickup',
          style: kScheduleHeader,
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 5),
          height: 2,
          width: 2,
          child: Center(
            child: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
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
                title: const Text('Category', style: kSchedulePickupTextField),
                subtitle: const Text('Select your category',
                    style: kSchedulePickupTextFieldHint),
                trailing: IconButton(
                  onPressed: () {},
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
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your waste quantities',
                      border: InputBorder.none,
                      hintStyle: kSchedulePickupTextFieldHint,
                    ),
                    style: const TextStyle(
                        color: kcBlack,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontStyle: FontStyle.normal),
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
                title: const Text('Schedule Date',
                    style: kSchedulePickupTextField),
                subtitle: Text(formattedDate,
                    style: const TextStyle(
                        color: kcBlack,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontStyle: FontStyle.normal)),
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
                        controller: _locationController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your pickup location',
                          border: InputBorder.none,
                          hintStyle: kSchedulePickupTextFieldHint,
                        ),
                        style: const TextStyle(
                            color: kcBlack,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            fontStyle: FontStyle.normal),
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
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheckboxChecked = !isCheckboxChecked;
                        });
                      },
                      icon: Icon(
                        isCheckboxChecked
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: isCheckboxChecked ? kcDeepGreen : kcGreyscale,
                      ),
                    ),
                    const Text(
                      'Use my current location',
                      style: kScheduleHeader,
                    ),
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
                    style: kScheduleType,
                  ),
                ),
              ],
            ),

            ///continue button
            GestureDetector(
              onTap: () {
                _showConfirmationSheet();
                // Navigator.pushNamed(context, ScheduleDetailsScreen.id);
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
