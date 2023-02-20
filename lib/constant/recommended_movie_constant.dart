// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_booking_app/constant/image_constant.dart';
import 'package:movie_booking_app/constant/string_constant.dart';

class RecommendedMovieConstant extends StatelessWidget {
  const RecommendedMovieConstant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(recommendedMovies, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15.sp)),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 175.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Category(image_location: avengersPoster, image_caption: 'Avengers', rating: '8.8/10'),
              Category(image_location: harryPotterPoster, image_caption: 'Harry Potter', rating: '7.5/10'),
              Category(image_location: piratesCaribbeanPoster, image_caption: 'Pirates Caribbean', rating: '7.4/10'),
              Category(image_location: thorPoster, image_caption: 'Thor', rating: '8.0/10'),
              Category(image_location: doctorStrangePoster, image_caption: 'Doctor Strange', rating: '8.2/10'),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final String rating;
  const Category({super.key, required this.image_location, required this.image_caption, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            /// =================== Image Location ===================
            Container(
              height: 125.h,
              width: 185.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                image: DecorationImage(image: AssetImage(image_location), fit: BoxFit.fill),
              ),
            ),

            /// =================== Image Caption ===================
            SizedBox(height: 6.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.yellow.shade700, size: 27.sp),
                    Text(rating, style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                Text(image_caption, style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
