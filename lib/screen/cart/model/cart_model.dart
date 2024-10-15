import 'package:flutter/material.dart';

class CartModel {
  String? title, description, category, image;
  int? id;
  var price;


  CartModel (
      {this.title,
        this.description,
        this.category,
        this.image,
        this.id,
        this.price});

  factory CartModel.mapToModel(Map m1) {
    return CartModel (
      image: m1['image'],
      title: m1['title'],
      id: m1['id'],
      category: m1['category'],
      description: m1['description'],
      price: m1['price'],
    );
  }
}

// class RatingModel {
//   num? rate;
//   int? count;
//
//   RatingModel({this.rate, this.count});
//
//   factory RatingModel.mapToModel(Map m1) {
//     return RatingModel(count: m1['count'], rate: m1['rate']);
//   }
// }
