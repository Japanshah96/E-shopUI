import 'package:e_shop/screens/add_address.dart';
import 'package:e_shop/screens/address.dart';
import 'package:e_shop/screens/cart.dart';
import 'package:e_shop/screens/categories.dart';
import 'package:e_shop/screens/favourites.dart';
import 'package:e_shop/screens/gift.dart';
import 'package:e_shop/screens/homescreen.dart';
import 'package:e_shop/screens/login.dart';
import 'package:e_shop/screens/payment.dart';
import 'package:e_shop/screens/product_info.dart';
import 'package:e_shop/screens/products.dart';
import 'package:e_shop/screens/profile.dart';
import 'package:e_shop/screens/settings.dart';
import 'package:e_shop/screens/signup.dart';
import 'package:e_shop/screens/splash.dart';
import 'package:e_shop/screens/update_password.dart';
import 'package:e_shop/screens/verifty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shop',

      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyApp(),
        ),
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            transition: Transition.leftToRight),
        GetPage(name: '/signup', page: () => const SignUp()),
        GetPage(name: '/verify', page: () => const VerifyScr()),
        GetPage(name: '/product', page: () => const ProductScreen()),
        GetPage(name: '/productinfo', page: () => const ProductInfo()),
        GetPage(name: '/payment', page: () => const PaymentPage()),
        GetPage(name: '/categories', page: () => const Categories()),
        GetPage(name: '/favourites', page: () => const Favourites()),
        GetPage(name: '/gifts', page: () => const Gifts()),
        GetPage(name: '/homescreen', page: () => const HomePage()),
        GetPage(name: '/profile', page: () => const Profile()),
        GetPage(name: '/cart', page: () => const Cart()),
        GetPage(name: '/address', page: () => Address()),
        GetPage(name: '/addaddress', page: () => AddAddress()),
        GetPage(name: '/setting', page: () => const Settings()),
        GetPage(name: '/password', page: () => const UpdatePassword()),
      ],
      // theme: ThemeData,
      home: const SplashScreen(),
    );
  }
}
