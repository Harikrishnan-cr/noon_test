import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/consts/image_paths.dart';
import 'package:noon/core/fonts/google_fonts.dart';
import 'package:noon/core/size/size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: .5,
        title: SvgPicture.asset(
          appLogoSvgImg,
          width: width * 0.25,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: Container(
              width: width * 0.68,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyColor, width: .8),
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: AppColors.greyColor,
                    ),
                    kwidth10,
                    Text(
                      'What are you looking for?',
                      style: GoogleFont.serachTextStyle,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/firstimagecropfinal.png',
            fit: BoxFit.fill,
            height: 38,
            width: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            height: 135,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  offerImages(index + 1),
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              pagination: const SwiperPagination(
                  margin: EdgeInsets.all(2), builder: SwiperPagination.dots),
              itemCount: 3,
              itemWidth: 300.0,
              itemHeight: 400.0,
            ),
          ),
          Container(
              width: double.infinity,
              height: 180,
              color: AppColors.lightYellow,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: List.generate(
                            10,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color: AppColors.blackColor,
                                  ),
                                ))),
                    Row(
                        children: List.generate(
                            9,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color: AppColors.blackColor,
                                  ),
                                )))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
