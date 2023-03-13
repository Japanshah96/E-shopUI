import 'package:e_shop/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxBool isEye = false.obs;
  RxBool isDone = false.obs;
  // RxBool isHover = false.obs;
  var tabidex = 0.obs;
  // for products.dart
  // RxList<String> products = [
  //   'Lenovo Thinkpad',
  //   'Dell inspiron',
  //   'Avita liber',
  //   'HP Pavilion',
  //   'ASUS ROG',
  //   'HP Omen',
  // ].obs;
  RxList<String> products = <String>[].obs;
  RxList<String> price = <String>[].obs;
  RxList<String> photos = <String>[
    // 'assets/images/product1.jpg',
    // 'assets/images/product2.jpg',
    // 'assets/images/product3.jpg',
    // 'assets/images/product4.jpg',
    // 'assets/images/product5.jpg',
    // 'assets/images/product6.jpg',
  ].obs;
}
