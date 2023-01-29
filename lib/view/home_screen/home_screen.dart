import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noon/core/color/colors.dart';
import 'package:noon/core/consts/image_paths.dart';
import 'package:noon/core/consts/products_list/products_list.dart';
import 'package:noon/core/consts/text_const.dart';
import 'package:noon/core/fonts/google_fonts.dart';
import 'package:noon/core/size/size.dart';
import 'package:noon/view/common/functions/app_bar/home_app_bar/home_app_bar.dart';
import 'package:noon/view/home_screen/sections/common_product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: homeAppBar(width),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/firstimagecropfinal.png',
            fit: BoxFit.fill,
            height: 38,
            width: double.infinity,
          ),
          SwiperWidget(swiperHeight: swiperHeight),
          const CatagoryTile(),
          const HomeHeadText(
            text: 'Recommended for you',
          ),
          CommonProductList(prdouctData: productsListData),
          MegadealWidgets(
              megaDealText1: megaDealText1,
              megaDealEmoji: megaDealEmoji,
              megaDealText2: megaDealText2,
              imgWidth: imgWidth,
              imageHeight: imageHeight,
              megSaleSec1: megSaleSec1,
              megSaleSecc2: megSaleSecc2),
          kheight5,
          const AdvertisemnetWidget(),
          DealsOnlyOnNoonWidget(
              imgWidth: imgWidth,
              dealsOnlySec1: dealsOnlySec1,
              dealsOnlySec2: dealsOnlySec2),
          kheight10,
          HomeSecondHeadings(text: text),
          CommonProductList(
            prdouctData: productsListData,
          ),
          const HomeHeadText(
            text: 'Best deals for you',
          ),
          CommonProductList(
            prdouctData: productsListData,
          ),
          kheight10,
          const SwiperWidget(swiperHeight: 100),
          kheight10,
          const HomeSecondHeadings(text: 'Trending deals in mobiles'),
          CommonProductList(
            prdouctData: productsListData,
          ),
          const ExploreWidget(),
          kheight10,
          const HomeSecondHeadings(text: 'Clearance deals'),
          CommonProductList(
            prdouctData: productsListData,
          ),
          Column(children: [
            FashionTileWidgetHead(width: width),
            const FashionTileList(),
          ]),
          Column(children: [
            FashionTileWidgetHead(width: width),
            const FashionTileList(),
          ]),
          Column(children: [
            FashionTileWidgetHead(width: width), 
            const FashionTileList(),
          ]),
          const AdvertisemnetWidget(),
          const LastWidgetHeading(text: 'Electronics'),
          const LastWidgetTile(),
          const LastWidgetHeading(text: 'Mobile & accessories'),
          const LastWidgetTile(),
          const LastWidgetHeading(text: 'Laptops & accessries'),
          const LastWidgetTile(),
          const AdvertisemnetWidget(),
          const LastWidgetHeading(text: 'Beauty'),
          const LastWidgetTile(),
          const LastWidgetHeading(text: 'Fragrances'),
          const LastWidgetTile(),
          const LastWidgetHeading(text: 'Home & kitchen favorites'),
          const LastWidgetTile(),
          const AdvertisemnetWidget(),
        ],
      ),
    );
  }
}

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: AppColors.lightYellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: RichText(
                text: TextSpan(style: GoogleFont.specialTextSApnOne, children: [
              const TextSpan(text: 'EXPLORE '),
              TextSpan(text: 'MORE', style: GoogleFont.specialTextSApnTwo),
            ])),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(8, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 95,
                  decoration: BoxDecoration(
                      color: AppColors.redColor,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/gameone.jpeg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
}

class DealsOnlyOnNoonWidget extends StatelessWidget {
  const DealsOnlyOnNoonWidget({
    Key? key,
    required this.imgWidth,
    required this.dealsOnlySec1,
    required this.dealsOnlySec2,
  }) : super(key: key);

  final double imgWidth;
  final List<String> dealsOnlySec1;
  final List<String> dealsOnlySec2;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imgWidth: imgWidth, imageHeight: 115, imageUrl: dealsOnlySec1),
          kheight15,
          MegaandDealsofDay(
              imgWidth: imgWidth, imageHeight: 115, imageUrl: dealsOnlySec2),
        ],
      ),
    );
  }
}

class MegadealWidgets extends StatelessWidget {
  const MegadealWidgets({
    Key? key,
    required this.megaDealText1,
    required this.megaDealEmoji,
    required this.megaDealText2,
    required this.imgWidth,
    required this.imageHeight,
    required this.megSaleSec1,
    required this.megSaleSecc2,
  }) : super(key: key);

  final String megaDealText1;
  final String megaDealEmoji;
  final String megaDealText2;
  final double imgWidth;
  final double imageHeight;
  final List<String> megSaleSec1;
  final List<String> megSaleSecc2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420,
      color: AppColors.lightYellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Mega deals of the day'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: RichText(
                text:
                    TextSpan(style: GoogleFont.dealsCommonTextstyle, children: [
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
    );
  }
}

class LastWidgetTile extends StatelessWidget {
  const LastWidgetTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            10,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 90,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/gametwo.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                )),
      ),
    );
  }
}

class LastWidgetHeading extends StatelessWidget {
  const LastWidgetHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFont.recomendeTiletext,
          ),
          Container(
            width: 80,
            height: 28,
            decoration: const BoxDecoration(color: AppColors.blackColor),
            child: Center(
              child: Text(
                'View All',
                style: GoogleFont.buttonFilledTextHomeLast,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdvertisemnetWidget extends StatelessWidget {
  const AdvertisemnetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: AppColors.secondaryGreyColor,
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
        child: Image.asset('assets/images/adv-img.jpeg'));
  }
}

class FashionTileList extends StatelessWidget {
  const FashionTileList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: AppColors.secondaryGreyColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 90,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/womens-fasion.png'),
                      fit: BoxFit.cover)),
            ),
          );
        }),
      ),
    );
  }
}

class FashionTileWidgetHead extends StatelessWidget {
  const FashionTileWidgetHead({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 36,
              color: AppColors.blackColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '50-80% OFF',
                  style: GoogleFont.fashionTileHeadText,
                ),
              ),
            ),
            Container(
              height: 36,
              width: double.infinity,
              color: AppColors.secondaryGreyColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "WOMEN'S FASHION",
                  style: GoogleFont.fashionTileSubHeadText,
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: 23,
            left: width * 0.77,
            child: Container(
              width: 70,
              height: 25,
              color: AppColors.greyColor,
              child: Center(
                  child: Text(
                'SHOP NOW',
                style: GoogleFont.fashionTileButtonText,
              )),
            ))
      ],
    );
  }
}

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    Key? key,
    required this.swiperHeight,
  }) : super(key: key);

  final double swiperHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: swiperHeight,
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
    );
  }
}

class HomeSecondHeadings extends StatelessWidget {
  const HomeSecondHeadings({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFont.recomendeTiletext,
          ),
          Container(
            width: 80,
            height: 28,
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.blueColor)),
            child: Center(
              child: Text(
                'View All',
                style: GoogleFont.transprantButtonTextSty,
              ),
            ),
          ),
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

                    decoration: const BoxDecoration(
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
                                child: const Center(
                                    child: Text(
                                  'Best seller',
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          : const SizedBox()),
                  const Positioned(
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
                  const Text(
                    'SAR',
                    style: TextStyle(fontSize: 11),
                  ),
                  kwidth5,
                  const Text('5,599.00',
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
                        const Text(
                          '777.00',
                          style: TextStyle(
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough),
                        ),
                        kwidth5,
                        const Text(
                          '58% OFF',
                          style: TextStyle(
                              color: AppColors.greenColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
                : const SizedBox(
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
                        style: const TextStyle(
                            color: AppColors.whiteColor, fontSize: 12),
                      ),
                      const Icon(
                        Icons.star_rate_rounded,
                        size: 15,
                        color: AppColors.whiteColor,
                      )
                    ],
                  ),
                ),
                const Text(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
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
      ),
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
  const HomeHeadText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(text, style: GoogleFont.homeScreenHead),
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
                              width: 58,
                              height: 70,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/cat-mobile.png'),
                                      fit: BoxFit.fill)),
                              //color: AppColors.blackColor,
                            ),
                          ))),
              Row(
                  children: List.generate(
                      9,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 58,
                              height: 70,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/cat-mobile.png'),
                                      fit: BoxFit.fill)),
                              //color: AppColors.blackColor,
                            ),
                          )))
            ],
          ),
        ));
  }
}
