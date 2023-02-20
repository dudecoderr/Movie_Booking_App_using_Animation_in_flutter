import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeHorizontalListview extends StatefulWidget {
  const TimeHorizontalListview({super.key});

  @override
  State<TimeHorizontalListview> createState() => _TimeHorizontalListviewState();
}

class _TimeHorizontalListviewState extends State<TimeHorizontalListview> {
  int timeIndexSelected = 1;
  final List<String> time = [
    '01.00',
    '02.00',
    '03.00',
    '04.00',
    '05.00',
    '06.00',
    '07.00',
    '08.00',
    '09.00',
    '10.00',
    '11.00',
    '12.00',
    '13.00',
    '14.00',
    '15.00',
    '16.00',
    '17.00',
    '18.00',
    '19.00',
    '20.00',
    '21.00',
    '22.00',
    '23.00',
    '24.00'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        itemCount: 24,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                timeIndexSelected = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 9.w, right: 9.w),
              child: Container(
                height: 35.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    border: Border.all(color: index == timeIndexSelected ? Colors.white : Colors.white),
                    color: timeIndexSelected == index ? Colors.white : Colors.transparent),
                child: Center(
                    child: Text(time[index],
                        style: TextStyle(
                            color: index == timeIndexSelected ? Colors.black : Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500))),
              ),
            ),
          );
        },
      ),
    );
  }
}
