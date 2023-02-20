// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_booking_app/constant/string_constant.dart';

class ReviewsConstant extends StatelessWidget {
  const ReviewsConstant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reviews, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15.sp)),
              Text('104k reviews', style: TextStyle(color: Colors.white, fontSize: 15.sp, decoration: TextDecoration.underline)),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 180.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Category(
                titleText: '#blockbuster #inspiring',
                subTitleText:
                    'The script is fine. But the execution is top notch. Feels a bit lengthy with the run time over 3hrs 10mins, but one can not deny the exhilarating experience. Undoubtedly watch it in 3D, if possible then in IMAX 3d definitely.',
                byReviewsText: 'Danny R.',
                ratingText: '8/10',
              ),
              Category(
                  titleText: '#Superdirection #nicesounds',
                  subTitleText:
                      'Amazing Movie. One can not deny the exhilarating experience. Undoubtedly watch it in 3D, if possible then in IMAX 3d definitely.',
                  byReviewsText: 'Rahul S.',
                  ratingText: '9/10'),
              Category(
                  titleText: '#Onetimewatch',
                  subTitleText: 'Not up to the mark! It\'s definitely nice. Where everyone is player the Movie.',
                  byReviewsText: 'Stella A.',
                  ratingText: '7/10'),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final String byReviewsText;
  final String ratingText;
  const Category({super.key, required this.titleText, required this.subTitleText, required this.byReviewsText, required this.ratingText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: InkWell(
        onTap: () {},
        child: GlassmorphicContainer(
          width: 300.w,
          height: 180.h,
          borderRadius: 15.sp,
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 300.w,
            height: 180.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// =================== titleText ===================
                Text(titleText, style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w700)),

                /// =================== subTitleText ===================
                SizedBox(height: 10.h),
                Text(subTitleText, style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    /// =================== RichText ===================
                    RichText(
                      text: TextSpan(
                        text: 'By ',
                        style: TextStyle(color: Colors.white, fontSize: 16.5.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: byReviewsText,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.5.sp, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),

                    /// =================== Rating ===================
                    const Spacer(),
                    Icon(Icons.star_rounded, color: Colors.yellow.shade700, size: 25.sp),
                    Text(ratingText, style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
