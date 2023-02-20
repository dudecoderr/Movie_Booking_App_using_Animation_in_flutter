// ignore_for_file: non_constant_identifier_names

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int current_index = 0;
  final List<Widget> pages = [];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: current_index, children: pages),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(70.sp), topRight: Radius.circular(70.sp)),
          child: CustomNavigationBar(
            backgroundColor: Colors.black,
            selectedColor: Colors.white,
            currentIndex: current_index,
            onTap: OnTapped,
            iconSize: 25.sp,
            items: [
              CustomNavigationBarItem(
                // icon: const Icon(Icons.home),
                icon: Image.asset('assets/movie_reel_bottom_icon.jpg', width: 60.w, height: 60.h),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.confirmation_number),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
