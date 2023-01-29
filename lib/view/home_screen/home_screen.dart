
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/consts/image_paths.dart';
import 'package:noon/core/fonts/google_fonts.dart';
import 'package:noon/core/size/size.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final isBestseller = true;
  final recamendedTileText =
      'Apple iPhone 14 Pro Max 256GB Deep Purple 5G With FaceTime - Middle East Version';
  final rating = 4.5;
  final isDiscount = false;
  final megaDealText1 = 'Mega deals of the day  ';
  final megaDealEmoji = '🕒 ';
  final megaDealText2 = '24 hours only!';
  final imageUrl = 'assets/images/mega-sales.png';
  List<String> megSaleSec1 = [
    'assets/images/mega-sales.png',
    'assets/images/mega-sales.png'
  ];
  List<String> megSaleSecc2 = [
    'assets/images/mega-sales.png',
    'assets/images/mega-sales.png'
  ];
  List<String> dealsOnlySec1 = [
    'assets/images/dealonly.png',
    'assets/images/dealsonly2.png'
  ];
  List<String> dealsOnlySec2 = [
    'assets/images/dealsonly2.png',
    'assets/images/dealonly.png'
  ];
  final imageHeight = 170.0;
  final imgWidth = 170.0;
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
          CatagoryTile(),
          HomeHeadText(),
          Container(
            height: 305,
            // color: AppColors.amberColor,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) {
                return ProductTileCommon(
                    isBestseller: isBestseller,
                    recamendedTileText: recamendedTileText,
                    isDiscount: isDiscount,
                    rating: rating);
              }),
            ),
          ),
          Container(
            width: double.infinity,
            height: 420,
            color: AppColors.lightYellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Mega deals of the day'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: RichText(
                      text: TextSpan(
                          style: GoogleFont.dealsCommonTextstyle,
                          children: [
                        TextSpan(text: megaDealText1),
                        TextSpan(text: megaDealEmoji),
                        TextSpan(
                            text: megaDealText2,
                            style: GoogleFont.megaDealSpecialTextstyle),
                      ])),
                ),
                MegaandDealsofDay(
                    imgWidth: imgWidth,
                    imageHeight: imageHeight,
                    imageUrl: megSaleSec1),
                kheight15,
                MegaandDealsofDay(
                    imgWidth: imgWidth,
                    imageHeight: imageHeight,
                    imageUrl: megSaleSecc2),
              ],
            ),
          ),
          kheight5,
          Container(
              color: AppColors.secondaryGreyColor,
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Image.asset('assets/images/adv-img.jpeg')),
          Container(
            color: AppColors.lightYellow,
            height: 290,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'DEALS ONLY ON NOON',
                    style: GoogleFont.dealsCommonTextstyle,
                  ),
                ),
                MegaandDealsofDay(
                    imgWidth: imgWidth,
                    imageHeight: 115,
                    imageUrl: dealsOnlySec1),
                kheight15,
                MegaandDealsofDay(
                    imgWidth: imgWidth,
                    imageHeight: 115,
                    imageUrl: dealsOnlySec2),
              ],
            ),
          ),
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
          kheight10,
        ],
      ),
    );
  }
}

class ProductTileCommon extends StatelessWidget {
  const ProductTileCommon({
    Key? key,
    required this.isBestseller,
    required this.recamendedTileText,
    required this.isDiscount,
    required this.rating,
  }) : super(key: key);

  final bool isBestseller;
  final String recamendedTileText;
  final bool isDiscount;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 305,
        width: 140,
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: 150,

                    decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        image: DecorationImage(
                            image: AssetAvifImage(
                                'assets/images/N53346840A_1.avif'),
                            fit: BoxFit.fill)),
                    // color: AppColors.blueColor,
                  ),
                  Positioned(
                      child: isBestseller
                          ? Padding(
                              padding: const EdgeInsets.all(6),
                              child: Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryBlackColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(
                                  'Best seller',
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          : SizedBox()),
                  Positioned(
                      left: 90,
                      top: 5,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.whiteColor,
                        child: Center(
                            child: Icon(
                          Icons.favorite_border_rounded,
                          size: 18,
                          color: AppColors.greyColor,
                        )),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SizedBox(
                  height: 40,
                  child: Text(
                    recamendedTileText,
                    style: GoogleFont.recomendeTiletext,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )),
            ),
            kheight10,
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'SAR',
                    style: TextStyle(fontSize: 11),
                  ),
                  kwidth5,
                  Text('5,599.00',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            kheight5,
            isDiscount
                ? Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: [
                        Text(
                          '777.00',
                          style: TextStyle(
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough),
                        ),
                        kwidth5,
                        Text(
                          '58% OFF',
                          style: TextStyle(
                              color: AppColors.greenColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
                : SizedBox(
                    height: 12,
                  ),
            kheight15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/svg/express.svg',
                  width: 38,
                  height: 15,
                ),
                Container(
                  width: 40,
                  height: 15,
                  decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rating.toString(),
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 12),
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        size: 15,
                        color: AppColors.whiteColor,
                      )
                    ],
                  ),
                ),
                Text(
                  '(119)',
                  style: TextStyle(fontSize: 12, color: AppColors.greyColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MegaandDealsofDay extends StatelessWidget {
  const MegaandDealsofDay({
    Key? key,
    required this.imgWidth,
    required this.imageHeight,
    required this.imageUrl,
  }) : super(key: key);

  final double imgWidth;
  final double imageHeight;
  final List<String> imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageTileMegaandDeals(
            imgWidth: imgWidth,
            imageHeight: imageHeight,
            imageUrl: imageUrl[0]),
        kwidth15,
        ImageTileMegaandDeals(
            imgWidth: imgWidth,
            imageHeight: imageHeight,
            imageUrl: imageUrl[1]),
      ],
    );
  }
}

class ImageTileMegaandDeals extends StatelessWidget {
  const ImageTileMegaandDeals({
    Key? key,
    required this.imgWidth,
    required this.imageHeight,
    required this.imageUrl,
  }) : super(key: key);

  final double imgWidth;
  final double imageHeight;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imgWidth,
      height: imageHeight,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill)),
    );
  }
}

class HomeHeadText extends StatelessWidget {
  const HomeHeadText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text('Recommended for you', style: GoogleFont.homeScreenHead),
    );
  }
}

class CatagoryTile extends StatelessWidget {
  const CatagoryTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}





// class ProductTileWidget extends StatelessWidget {
//   const ProductTileWidget({
//     Key? key,
//     required this.isBestseller,
//     required this.recamendedTileText,
//     required this.isDiscount,
//     required this.rating,
//   }) : super(key: key);

//   final bool isBestseller;
//   final String recamendedTileText;
//   final bool isDiscount;
//   final double rating;

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
