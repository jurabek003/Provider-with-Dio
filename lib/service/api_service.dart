import 'package:dio/dio.dart';
import 'package:provide_with_dio/data/madels/product/Product.dart';
class ApiService {

Future getAllProducts() async {
  Dio dio = Dio();
  print("ketti");
  Response response = await dio.get('https://fakestoreapi.com/products');

  if (response.statusCode == 200) {

    print("keldi ${response.data}");
    List products = response.data.map((e) =>  Product.fromJson(e)).toList();
    return products;

  } else {
    print("hatolik ${response.statusCode}");
    throw Exception('Failed to get data from the server');
  }

}

}