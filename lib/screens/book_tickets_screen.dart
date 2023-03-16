import 'dart:ui';

import 'package:animated_page_transition/animated_page_transition.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_booking_app/screens/booking_screen.dart';
import 'package:movie_booking_app/screens/home_screen.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:ticket_widget/ticket_widget.dart';

class BookTicketsScreen extends StatefulWidget {
  final String imageList;
  final String movieName;
  const BookTicketsScreen({Key? key, required this.imageList, required this.movieName}) : super(key: key);

  @override
  State<BookTicketsScreen> createState() => _BookTicketsScreenState();
}

class _BookTicketsScreenState extends State<BookTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return PageTransitionReceiver(
      scaffold: Scaffold(
        body: Container(
          /// =================== Background Image ===================
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.imageList), fit: BoxFit.fill),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),

            /// =================== Column ===================
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// =================== Back Icon ===================
                Padding(
                  padding: EdgeInsets.only(right: 265.w, top: 40.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingScreen(imageList: widget.imageList, movieName: widget.movieName),
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

                // SizedBox(height: 50.h),
                Center(
                  child: TicketWidget(
                    width: 300.w,
                    height: 500.w,
                    // isCornerRounded: true,
                    padding: const EdgeInsets.all(20),
                    child: TicketData(movieName: widget.movieName),
                  ),
                ),

                /// =================== Select Seats ===================
                // const Spacer(),
                SizedBox(
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
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: Text('DONE', style: TextStyle(color: Colors.black, fontSize: 15.sp))),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatefulWidget {
  final String movieName;
  final bool? isSelected;
  const TicketData({Key? key, required this.movieName, this.isSelected}) : super(key: key);

  @override
  State<TicketData> createState() => _TicketDataState();
}

class _TicketDataState extends State<TicketData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 230.w,
          // width: 300,
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// =================== Movie ===================
              Text('MOVIE', style: TextStyle(color: Colors.grey, fontSize: 15.sp)),
              SizedBox(height: 3.h),
              Text(widget.movieName, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),

              /// =================== Date ===================
              SizedBox(height: 13.h),
              Text('DATE', style: TextStyle(color: Colors.grey, fontSize: 15.sp)),
              SizedBox(height: 3.h),
              Text('10/09', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),

              /// =================== Time ===================
              SizedBox(height: 13.h),
              Text('TIME', style: TextStyle(color: Colors.grey, fontSize: 15.sp)),
              SizedBox(height: 3.h),
              Text('18:00', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),

              /// =================== Seats ===================
              SizedBox(height: 13.h),
              Text('Seats', style: TextStyle(color: Colors.grey, fontSize: 15.sp)),
              SizedBox(height: 3.h),
              Text('G2,G3', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500)),
            ],
          ),
        ),

        // SizedBox(height: 13.h),
        const Center(child: DottedLine(dashColor: Colors.grey, lineThickness: 2, dashLength: 6)),

        /// =================== QR Code ===================
        SizedBox(height: 40.h),
        Center(
          child: PrettyQr(
            typeNumber: 3,
            size: 150,
            data: 'https://www.google.ru',
            errorCorrectLevel: QrErrorCorrectLevel.M,
            roundEdges: true,
          ),
        ),
      ],
    );
  }
}
