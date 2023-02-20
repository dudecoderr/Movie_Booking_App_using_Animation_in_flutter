import 'package:animated_page_transition/animated_page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_booking_app/constant/horizontal_listview/date_picker.dart';
import 'package:movie_booking_app/constant/seates.dart';
import 'package:movie_booking_app/screens/book_tickets_screen.dart';
import 'package:movie_booking_app/screens/detail_screen.dart';
import 'package:movie_booking_app/screens/time_picker.dart';

class BookingScreen extends StatefulWidget {
  final String imageList;
  final String movieName;
  const BookingScreen({Key? key, required this.imageList, required this.movieName}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 710.h,

          /// =================== Background Image ===================
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.imageList), fit: BoxFit.fill),
          ),

          child: GlassmorphicContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            borderRadius: 0.sp,
            blur: 30,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
              const Color(0xFFffffff).withOpacity(0.1),
              const Color(0xFFFFFFFF).withOpacity(0.05),
            ], stops: const [
              0.1,
              1
            ]),
            borderGradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.transparent, Colors.transparent],
            ),

            /// =================== Column ===================
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  /// =================== Back Icon ===================
                  Padding(
                    padding: EdgeInsets.only(right: 265.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(imageList: widget.imageList, movieName: widget.movieName),
                          ),
                        );
                      },
                      child: Container(
                        height: 40.h,
                        width: 43.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: Colors.white54),
                        child: const Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ),

                  /// =================== Day ===================
                  SizedBox(height: 5.h),
                  Text('Day', style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.h),
                  const DatePicker(),

                  /// =================== Time ===================
                  SizedBox(height: 15.h),
                  Text('Time', style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 8.h),
                  const TimeHorizontalListview(),

                  /// =================== Movie Image ===================
                  SizedBox(height: 25.h),
                  Container(
                    height: 120.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      image: DecorationImage(image: AssetImage(widget.imageList), fit: BoxFit.fill),
                    ),
                  ),

                  /// =================== Select Seats ===================
                  SizedBox(height: 20.h),
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Second Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Third Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Forth Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Fifth Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  // Sixth Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                      SelectSeat(),
                    ],
                  ),

                  /// =================== Select Seats ===================
                  SizedBox(height: 15.h),
                  PageTransitionButton(
                    vsync: this,
                    nextPage: BookTicketsScreen(imageList: widget.imageList, movieName: widget.movieName),
                    child: SizedBox(
                      height: 55.h,
                      width: 210.w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow.shade700,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookTicketsScreen(imageList: widget.imageList, movieName: widget.movieName),
                              ),
                            );
                          },
                          child: Text('Book Tickets', style: TextStyle(color: Colors.black, fontSize: 15.sp))),
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
