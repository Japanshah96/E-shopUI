import 'package:e_shop/controller/login_controller.dart';
import 'package:e_shop/screens/cart.dart';
import 'package:e_shop/screens/favourites.dart';
import 'package:e_shop/screens/payment.dart';
import 'package:e_shop/screens/products.dart';
import 'package:e_shop/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller(), permanent: false);
    return Scaffold(
      bottomNavigationBar:
          //  BottomAppBar(child: ,),
          Obx(
        () => BottomNavigationBar(
            onTap: (value) {
              controller.tabidex.value = value;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue.withOpacity(0.3),
            // selectedItemColor: Colors.blue[700],
            // unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  color: controller.tabidex.value == 0
                      ? Colors.blueAccent
                      : Colors.black,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: controller.tabidex.value == 1
                        ? Colors.blueAccent
                        : Colors.black,
                  ),
                  label: 'favourites'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: controller.tabidex.value == 2
                        ? Colors.blueAccent
                        : Colors.black,
                  ),
                  label: 'cart'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: controller.tabidex.value == 3
                        ? Colors.blueAccent
                        : Colors.black,
                  ),
                  label: 'profile'),
            ]),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.tabidex.value,
          children: [
            ProductScreen(),
            Favourites(),
            Cart(),
            Profile(),
          ],
        ),
      ),
    );
  }
}
