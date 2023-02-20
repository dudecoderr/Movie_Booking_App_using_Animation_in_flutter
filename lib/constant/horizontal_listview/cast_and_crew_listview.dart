// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_booking_app/constant/image_constant.dart';
import 'package:movie_booking_app/constant/string_constant.dart';

/// ============================= Cast Horizontal Listview =============================
class CastHorizontalListview extends StatelessWidget {
  const CastHorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(cast, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15.sp)),
        ),
        SizedBox(
          height: 150.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CastCategory(image_location: firstCast, image_caption: 'joe Saldana', sub_tex: "as Neyitrl"),
              CastCategory(image_location: secondCast, image_caption: 'Sam Worthington', sub_tex: "as Jake Sully"),
              CastCategory(image_location: thirdCast, image_caption: 'Sigourney Weaver', sub_tex: "as Grace"),
              CastCategory(image_location: forthCast, image_caption: 'Amanda Silver', sub_tex: "Writer"),
            ],
          ),
        ),
      ],
    );
  }
}

class CastCategory extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final String? sub_tex;
  const CastCategory({super.key, required this.image_location, required this.image_caption, this.sub_tex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 95.w,
          height: 150.w,
          child: ListTile(
            /// =================== Image ===================
            title: CircleAvatar(
              radius: 50.sp,
              backgroundImage: AssetImage(image_location),
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// =================== Image Caption ===================
                  Text(
                    image_caption,
                    style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),

                  /// =================== Sub Text ===================
                  SizedBox(height: 3.h),
                  Text(
                    sub_tex!,
                    style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ============================= Crew Horizontal Listview =============================
class CrewHorizontalListview extends StatelessWidget {
  const CrewHorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(cast, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15.sp)),
        ),
        SizedBox(
          height: 150.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CrewCategory(image_location: firstCast, image_caption: 'joe Saldana', sub_tex: "as Neyitrl"),
              CrewCategory(image_location: thirdCast, image_caption: 'Sigourney Weaver', sub_tex: "as Grace"),
              CrewCategory(image_location: forthCast, image_caption: 'Amanda Silver', sub_tex: "Writer"),
            ],
          ),
        ),
      ],
    );
  }
}

class CrewCategory extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final String? sub_tex;
  const CrewCategory({super.key, required this.image_location, required this.image_caption, this.sub_tex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 95.w,
          height: 150.w,
          child: ListTile(
            /// =================== Image ===================
            title: CircleAvatar(
              radius: 50.sp,
              backgroundImage: AssetImage(image_location),
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// =================== Image Caption ===================
                  Text(
                    image_caption,
                    style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),

                  /// =================== Sub Text ===================
                  SizedBox(height: 3.h),
                  Text(
                    sub_tex!,
                    style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
