import 'package:get/get.dart';

class FavouritesController extends GetxController {
  RxList<int> number = <int>[].obs;
  RxList<int> atc = <int>[].obs;
  var selected = 'Ascending'.obs;
  // final selected = [
  //   'Ascending'
  //       'Descending'
  //       'Price: Low to High'
  //       'Price: High to Low'
  // ].obs;
  void setSelected(String value) {
    // selected.value = value;
  }
}
