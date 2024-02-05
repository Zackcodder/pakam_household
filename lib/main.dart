import 'package:flutter/material.dart';
import 'package:pakam_household/constants/colors.dart';
import 'package:pakam_household/screens/drop_off_schedule_details.dart';
import 'package:pakam_household/screens/dropoff_loading.dart';
import 'package:pakam_household/screens/home.dart';
import 'package:pakam_household/screens/schedule.dart';
import 'package:pakam_household/screens/schedule_details.dart';
import 'package:pakam_household/screens/schedule_dropoff.dart';
import 'package:pakam_household/screens/schedule_pickup.dart';
import 'package:pakam_household/screens/selected_waste_category.dart';
import 'package:pakam_household/screens/wallet.dart';

String? selectedWasteCategory;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kcGreen,
      title: 'Pakam Household',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kcWhite),
        useMaterial3: true,
      ),
      initialRoute: ScheduleScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        ScheduleScreen.id: (context) => const ScheduleScreen(),
        WalletScreen.id: (context) => const WalletScreen(),
        SchedulePickupScreen.id: (context) => const SchedulePickupScreen(),
        ScheduleDropOffScreen.id: (context) => const ScheduleDropOffScreen(),
        SelectWasteCategoryScreen.id: (context) => const SelectWasteCategoryScreen(),
        ScheduleDetailsScreen.id: (context) => const ScheduleDetailsScreen(),
        DropOffLoadingScreen.id: (context) => const DropOffLoadingScreen(),
        DropOffScheduleDetailsScreen.id: (context) => const DropOffScheduleDetailsScreen(),
         },
    );
  }
}