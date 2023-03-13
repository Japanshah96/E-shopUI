import 'dart:developer';

import 'package:e_shop/Apis/api_service.dart';
import 'package:e_shop/Apis/product_model.dart';
import 'package:e_shop/controller/login_controller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  Controller controller = Get.put(Controller(), permanent: false);
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
        productList.forEach((element) {
          controller.products.add(element.title);
        });
        productList.forEach((element) {
          controller.price.add(element.price.toString());
        });
        productList.forEach((element) {
          controller.photos.add(element.image);
        });
        // pData.value = products;
        // log(pData.value.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
