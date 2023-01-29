import 'package:flutter/cupertino.dart';
import 'package:noon/model/products_model/products_model.dart';

import 'package:noon/view/home_screen/home_screen.dart';

class CommonProductList extends StatelessWidget {
  const CommonProductList({super.key, required this.prdouctData});
  final List<ProductsModelClass> prdouctData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
          final data = prdouctData[index];
          return ProductTileCommon(
              isBestseller: data.isBestseller,
              recamendedTileText: data.title,
              isDiscount: data.isDiscount,
              rating: data.rating);
        }),
      ),
    );
  }
}
