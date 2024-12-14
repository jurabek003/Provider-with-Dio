import 'package:flutter/material.dart';

import 'package:provide_with_dio/service/api_service.dart';

class ProductsViewModel extends ChangeNotifier{
  List products= [];

  void getProducts() async{
    print("ketti");
    products= await ApiService().getAllProducts();
    print(products);
    notifyListeners();
  }
}