import 'dart:async';

import 'package:e_shop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.toNamed('/login');
        },
        child: Container(
          // decoration: BoxDecoration(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/cart.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
