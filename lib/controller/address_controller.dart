// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class AddressController extends GetxController {
  RxList<String> country = <String>[].obs;
  RxList<String> addresses = <String>[].obs;
  RxList<String> number = <String>[].obs;

  var nameCountry = ''.obs;
  var nameAddress = ''.obs;
  var nameNumber = ''.obs;
}
