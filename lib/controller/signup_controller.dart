import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_shop/screens/signup.dart';
import 'package:e_shop/screens/login.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool isEye = false.obs;
  RxBool switch1 = false.obs;
  RxBool vali = false.obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString logEmail = ''.obs;
  RxString password = ''.obs;
  RxString logPassword = ''.obs;

  final formkey = GlobalKey<FormState>();
  signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.toNamed('/verify');
      email.value = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: logEmail.value,
        password: logPassword.value,
      );
      Get.toNamed('/verify');
      logEmail.value = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
