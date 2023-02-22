import 'package:e_shop/controller/categories_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatController categoryController =
        Get.put(CatController(), permanent: false);
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     backgroundColor: Colors.blue.withOpacity(0.3),
      //     selectedItemColor: Colors.blue[700],
      //     unselectedItemColor: Colors.black,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home_rounded), label: 'home'),
      //       BottomNavigationBarItem(
      //           icon: Icon(CupertinoIcons.heart), label: 'favourites'),
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //               child: Icon(Icons.shopping_cart),
      //               onTap: () {
      //                 Get.toNamed('payment');
      //               }),
      //           label: 'cart'),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
      //     ]),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue.withOpacity(0.2),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Select your category',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0, crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed('productinfo');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    // width: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue.withOpacity(0.1)),
                                    child: Icon(
                                      categoryController
                                          .categoryicons.value[index],
                                    ),
                                  ),
                                ),
                                Text(
                                  categoryController.categorynames.value[index],
                                )
                              ],
                            ),
                          );
                          // Text('Webcam');
                        }),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: GestureDetector(
              child: Icon(Icons.arrow_back_ios_new_rounded),
              onTap: () {
                Get.toNamed('product');
              },
            ),
          ),
        ],
      ),
    );
  }
}
