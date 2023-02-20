// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_booking_app/constant/image_constant.dart';
import 'package:movie_booking_app/constant/string_constant.dart';
import 'package:movie_booking_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current_index = 0;
  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  int index = 0;

  /// =================== Slider Image List ===================
  final List<String> imageList = [avatarPoster, blackPantherPoster, varisuPoster, blackAdamPoster];
  final List<String> movieName = ['Avatar', 'Black Panther', 'Varisu', 'Black Adam'];

  CarouselController controller = CarouselController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /// =================== Background Image ===================
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(avatarPoster), fit: BoxFit.fill),
        ),

        /// =================== Glassmorphism Container ===================
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
                child: Row(
                  children: [
                    /// =================== Text ===================
                    Text(movieName[index], style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w700)),
                    const Spacer(),

                    /// =================== Search Icon ===================
                    Icon(Icons.search, color: Colors.white, size: 30.sp),

                    /// =================== Notification Icon ===================
                    SizedBox(width: 10.w),
                    Icon(Icons.notifications_none_outlined, color: Colors.white, size: 30.sp),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Row(
                  children: [
                    /// =================== Action ===================
                    Container(
                      width: 70.w,
                      height: 30.h,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.white), color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text(action, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                    ),

                    /// =================== Sci-Fi ===================
                    SizedBox(width: 10.w),
                    Container(
                      width: 60.w,
                      height: 30.h,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.white), color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text(sciFi, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                    ),

                    /// =================== Adventure ===================
                    SizedBox(width: 10.w),
                    Container(
                      width: 90.w,
                      height: 30.h,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.white), color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text(adventure, style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Row(
                  children: [
                    /// =================== Star Icon ===================
                    Icon(Icons.star_rounded, color: Colors.yellow.shade700, size: 27.sp),

                    /// =================== Votes ===================
                    Text(votes,
                        style: TextStyle(fontSize: 17.sp, color: Colors.white, fontWeight: FontWeight.w700, decoration: TextDecoration.underline)),

                    /// =================== Watch Trailer ===================
                    const Spacer(),
                    Container(
                      width: 130.w,
                      height: 40.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Colors.black54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 25.sp),
                          Text(watchTrailer, style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// =================== Slider ===================
              Container(
                margin: EdgeInsets.all(15.sp),
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  carouselController: controller,
                  options: CarouselOptions(
                      onPageChanged: (i, reason) {
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                          if (index != i) {
                            setState(() {
                              index = i;
                              print("tbgt   */-*-*-*-   ${index}  ${i}");
                            });
                          }
                        });
                      },
                      enlargeCenterPage: true,
                      height: 400.h,
                      autoPlay: false,
                      viewportFraction: 0.95,
                      autoPlayInterval: const Duration(seconds: 3),
                      reverse: false,
                      aspectRatio: 5.0),
                  itemBuilder: (context, i, id) {
                    return Hero(
                      tag: imageList[i],
                      child: GestureDetector(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => DetailScreen(imageList: imageList[i], movieName: movieName[i])));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              // border: Border.all(color: Colors.white),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(imageList[i], width: 500, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        onTap: () {
                          var url = imageList[i];
                          print(url.toString());
                        },
                      ),
                    );
                  },
                ),
              ),

              /// =================== Bottom NavigationBar ===================
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w),
                  child: SizedBox(
                    height: 80.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(75.sp), topRight: Radius.circular(75.sp)),
                      child: CustomNavigationBar(
                        backgroundColor: Colors.black,
                        selectedColor: Colors.grey,
                        currentIndex: current_index,
                        // onTap: OnTapped,
                        iconSize: 25.sp,
                        items: [
                          CustomNavigationBarItem(
                            icon: Image.asset('assets/movie_reel_icon.jpg', height: 90, width: 90),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
