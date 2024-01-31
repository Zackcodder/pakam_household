
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class SelectWasteCategoryScreen extends StatefulWidget {
  static String id = 'selected_waste_category_screen';
  const SelectWasteCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SelectWasteCategoryScreen> createState() =>
      _SelectWasteCategoryScreenState();
}

class _SelectWasteCategoryScreenState extends State<SelectWasteCategoryScreen> with TickerProviderStateMixin{
  List<String> wasteItems = [
    'Transparent PET Bottle',
    'Green PET Bottle',
    'Other Colored PET Bottle',
    'Mixed PET Bottle',
  ];

  String? selectedPetBottle; // Track the selected item
  bool isListVisible = false;
  Set<String> selectedPetBottles = {}; // Track selected items



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Select Waste Category',
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
            const Text(
              textAlign: TextAlign.justify,
              "Select each waste you'd like for pick-up from the waste category.",
              style: kSelectWasteHeaderText,
            ),
            const SizedBox(height: 16.0),

            ///search box
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 56),
              height: 46,
              decoration: BoxDecoration(
                border: Border.all(color: kcDeepGreen),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: ((value) {}),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 2),
                  hintText: 'Search for categories',
                  hintStyle: kSchedulePickupTextFieldHint,
                  // prefixIcon:Icon(Icons.menu_outlined, color: kcGrey,size: 24.0,),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25.0,
                    weight: 10,
                    color: kcDeepGreen,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(45.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            ///show selected item
            // Selected items display
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: selectedPetBottles.map((String selectedItem) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8, right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: kcSelectedItemColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedItem, style: kScheduleType),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPetBottles.remove(selectedItem);
                          });
                        },
                        child: Icon(Icons.cancel,
                          color: kcSelectedItemColor.withOpacity(0.3),),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            ///pet bottle
            Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isListVisible = !isListVisible;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Pet Bottle', style: kSelectWasteHeaderOptionText),
                        Icon(
                          isListVisible
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: kcBlack,
                        ),
                      ],
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    // vsync: this,
                    child: isListVisible
                        ? Column(
                      children: wasteItems.map((String item) {
                        bool isSelected = selectedPetBottles.contains(item);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedPetBottles.remove(item);
                              } else {
                                selectedPetBottles.add(item);
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            color:  Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item),
                                if (isSelected)
                                  const Icon(
                                    Icons.check,
                                    color: kcDeepGreen,
                                    size: 20,
                                  ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),


            ///Nylon
            Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Nylon',style: kSelectWasteHeaderOptionText,),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kcBlack,
                      ))
                ],
              ),
            ),

            ///paper
            Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Paper',style: kSelectWasteHeaderOptionText,),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kcBlack,
                      ))
                ],
              ),
            ),

            ///Bags
            Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Bags',style: kSelectWasteHeaderOptionText,),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kcBlack,
                      ))
                ],
              ),
            ),

            ///cans
            Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Can',style: kSelectWasteHeaderOptionText,),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kcBlack,
                      ))
                ],
              ),
            ),

            ///Cartons
            Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cartons',style: kSelectWasteHeaderOptionText,),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kcBlack,
                      ))
                ],
              ),
            ),

            ///Plastics
            Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Plastics',style: kSelectWasteHeaderOptionText,),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: kcBlack,
                      ))
                ],
              ),
            ),

            ///Done
            GestureDetector(
              onTap: () {
                Navigator.pop(context,);
                // Navigator.pushNamed(context, AddContactSuccessPage.id);
              },
              child: Container(
                  margin: const EdgeInsets.only(bottom: 44, top: 64),
                  height: 50,
                  decoration: BoxDecoration(
                    color: kcGreen,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kcWhite),
                  ),
                  child: const Center(
                    child: Text(
                      'Done',
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
