

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ProductsModelClass{

  bool isBestseller;
  bool isDiscount;
  String? disCountedPrice; 
  String realPrice;
  double rating;
  String noOfComments;
  String imageUrl;
  String? disCountPercenTage;
  String title;
Color ratingColor;

  ProductsModelClass({this.disCountPercenTage,this.disCountedPrice,required this.ratingColor, required this.imageUrl,required this.realPrice,required this.isBestseller,required this.isDiscount,required this.noOfComments,required this.rating,required this.title});
  
}