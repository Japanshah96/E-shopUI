import 'dart:developer';

import 'package:e_shop/Apis/api_service.dart';
import 'package:e_shop/Apis/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;

  void onInit() {
    fetchProducts();
    super.onInit();
  }

  // var pData = ProductModel().obs;
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService().fetchProducts();
      if (products != null) {
        productList.assignAll(products);
        // pData.value = products;
        // log(pData.value.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
