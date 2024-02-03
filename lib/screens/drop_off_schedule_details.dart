import 'package:flutter/material.dart';
import 'package:pakam_household/screens/schedule.dart';
import 'package:pakam_household/screens/selected_waste_category.dart';

import '../constants/colors.dart';
import 'package:intl/intl.dart';
import '../constants/text_style.dart';

class DropOffScheduleDetailsScreen extends StatefulWidget {
  static String id = 'schedule_drop_off_details_screen';
  const DropOffScheduleDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DropOffScheduleDetailsScreen> createState() => _DropOffScheduleDetailsScreenState();
}

class _DropOffScheduleDetailsScreenState extends State<DropOffScheduleDetailsScreen> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool isCheckboxChecked = false;
  bool isCheckboxChecked1 = false;
  bool isCheckboxChecked2 = false;

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
                      icon: const Icon(Icons.cancel, color: kcIconGrey,),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, ScheduleScreen.id);
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
                  'Your drop off request has been received.',
                  style: TextStyle(
                      color: kcIconGrey,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                      fontSize: 13,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
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
                          ///drop off location
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kcBackgroundColor,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontStyle: FontStyle.normal),)],
                                ),
                              ],
                            ),
                          ),
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

                          ///drop off date date
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Drof off Date:  ',
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

                          ///Drop off Time
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Drop off Time:  ',
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


                    ///confirm button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        _showSubmittingDialog();
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

  ///submitting and cancel request
  _showSubmittingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.pop(context); // Close the submitting dialog after 5 seconds
          _showSuccessDialog(); // Show the success dialog
        });

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
                          'Cancel Request',
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


  @override
  Widget build(BuildContext context) {
    String formattedDate = _selectedDate != null
        ? DateFormat('MMMM dd, yyyy').format(_selectedDate!)
        : "Select a date";
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
        margin: const EdgeInsets.only(top: 25, left: 23, right: 15),
        child: ListView(
          children: [
            const Text(
              textAlign: TextAlign.justify,
              "Schedule Drop off to:",
              style: kSelectWasteHeaderText,
            ),

            ///drop off location details
            Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kcDeepGreen,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lawma Recyclers', style: kScheduleType,),
                  ///Address
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: kcWhite, size: 15,),
                      SizedBox(width: 5,),
                      Text("3, Olaniyi Stresst, idi Oro, Lagos",style: kDropOffDetailsBodyText,)
                    ],
                  ),
                  SizedBox(height: 5,),

                  ///phone number
                  Row(
                    children: [
                      Icon(Icons.phone, color: kcWhite, size: 15,),
                      SizedBox(width: 5,),
                      Text("0908 790 8769, 0112 789 8789", style: kDropOffDetailsBodyText,)
                    ],
                  ),
                  SizedBox(height: 5,),

                  ///time
                  Row(
                    children: [
                      Icon(Icons.alarm, color: kcWhite, size: 15,),
                      SizedBox(width: 5,),
                      Text("9:00am - 4:00pm", style: kDropOffDetailsBodyText,)
                    ],
                  ),
                  SizedBox(height: 5,),

                  ///item
                  Row(
                    children: [
                      Icon(Icons.business_center_outlined, color: kcWhite, size: 15,),
                      SizedBox(width: 5,),
                      Text("Can, Pet Bottle, Wood, Nylon",style: kDropOffDetailsBodyText,)
                    ],
                  ),
                ],
              ),
            ),


            ///category
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              // padding: const EdgeInsets.all(8.0),
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
            ///Waste
            Text('Waste Quantity', style: kScheduleType,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///1-5bags
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
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isCheckboxChecked ? kcDeepGreen : kcGreyscale,
                      ),
                    ),
                    const Text(
                      '1-5 bags',
                      style: kWasteQuantityText,
                    ),
                  ],
                ),

                ///5-10bags
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheckboxChecked1 = !isCheckboxChecked1;
                        });
                      },
                      icon: Icon(
                        isCheckboxChecked1
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isCheckboxChecked1 ? kcDeepGreen : kcGreyscale,
                      ),
                    ),
                    const Text(
                      '5-10 bags',
                      style: kWasteQuantityText,
                    ),
                  ],
                ),

                ///10-15bags
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheckboxChecked2 = !isCheckboxChecked2;
                        });
                      },
                      icon: Icon(
                        isCheckboxChecked2
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isCheckboxChecked2 ? kcDeepGreen : kcGreyscale,
                      ),
                    ),
                    const Text(
                      '10-15 bags',
                      style: kWasteQuantityText,
                    ),
                  ],
                ),
              ],
            ),

            ///if other
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'If others, specify the quantity',
                    style: kSchedulePickupTextField,
                  ),
                  TextFormField(
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

            ///drop off date
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
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
                title: const Text('Select drop off date',
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

            ///drop off time
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
                    'Drop off Time',
                    style: kSchedulePickupTextField,
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      hintText: 'Enter drop off time',
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

            ///continue button
            GestureDetector(
              onTap: () {
                _showConfirmationSheet();
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
