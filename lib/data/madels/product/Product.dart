import 'package:provide_with_dio/data/madels/product/Rating.dart';

class Product{
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;


  Product({
  required this.id,
  required this.title,
  required this.price,
  required this.description,
  required this.category,
  required this.image,
  required this.rating,

});
    factory Product.fromJson(Map<String,dynamic> json){
      return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']),
      );
    }

}