import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxBool isEye = false.obs;
  RxBool isDone = false.obs;
  var tabidex = 0.obs;
  // for products.dart
  RxList<String> products = [
    'Lenovo Thinkpad',
    'Dell inspiron',
    'Avita liber',
    'HP Pavilion',
    'ASUS ROG',
    'HP Omen',
  ].obs;
  RxList<String> price = [
    '₹36,000',
    '₹43,000',
    '₹65,000',
    '₹37,500',
    '₹52,000',
    '₹49,999',
  ].obs;
  RxList<String> photos = [
    'assets/images/product1.jpg',
    'assets/images/product2.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpg',
    'assets/images/product5.jpg',
    'assets/images/product6.jpg',
  ].obs;
}
