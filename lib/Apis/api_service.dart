import 'dart:convert';
import 'dart:developer';

import 'package:e_shop/Apis/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var client = http.Client();

  Future<List<ProductModel>> fetchProducts() async {
    var response =
        await client.get(Uri.parse("https://fakestoreapi.com/products"));
    // log('ss' + response.body);
    if (response.statusCode == 200) {
      // var jsonString = response.body;
      // return ProductModel();
      // final productModel = productModelFromJson(jsonString);
      // log(productModel.first.category.toString());
      return productModelFromJson(response.body);
    }
    return productModelFromJson(response.body);
    // throw true;
  }
}
