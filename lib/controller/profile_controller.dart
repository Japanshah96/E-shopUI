import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCont extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxBool isLoading = false.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              'Mb';
      Get.back();
    } else {
      Get.snackbar('No image selected!!!', 'Please select an image',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void uploadFile() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
  }
}
