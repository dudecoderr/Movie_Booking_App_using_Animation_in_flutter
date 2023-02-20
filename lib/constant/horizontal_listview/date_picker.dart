// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int dateIndexSelected = 1;
  DateTime currentDate = DateTime.now();

  String _dayFormat(int dayWeek) {
    switch (dayWeek) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "Mon";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.builder(
        itemCount: 30,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var date = currentDate.add(Duration(days: index));
          return GestureDetector(
            onTap: () {
              setState(() {
                dateIndexSelected = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 9.w, right: 9.w),
              child: Container(
                height: 55.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    border: Border.all(color: index == dateIndexSelected ? Colors.white : Colors.white),
                    color: dateIndexSelected == index ? Colors.white : Colors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_dayFormat(date.weekday),
                        style: TextStyle(color: index == dateIndexSelected ? Colors.black : Colors.white, fontSize: 16.sp)),
                    Text(date.day.toString(),
                        style:
                            TextStyle(color: index == dateIndexSelected ? Colors.black : Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
