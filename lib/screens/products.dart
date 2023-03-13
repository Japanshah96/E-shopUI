import 'package:e_shop/controller/favourites_controller.dart';
import 'package:e_shop/controller/login_controller.dart';
import 'package:e_shop/controller/product_controller.dart';
import 'package:e_shop/Apis/api_service.dart';
import 'package:e_shop/Apis/product_model.dart';
import 'package:e_shop/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller pdController = Get.put(Controller(), permanent: false);
    ProductController apiController =
        Get.put(ProductController(), permanent: false);
    FavouritesController favouritesController =
        Get.put(FavouritesController(), permanent: false);
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
      //           icon: GestureDetector(
      //             child: Icon(CupertinoIcons.heart),
      //             onTap: () {
      //               Get.toNamed('favourites');
      //             },
      //           ),
      //           label: 'favourites'),
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //               child: Icon(Icons.shopping_cart),
      //               onTap: () {
      //                 Get.toNamed('payment');
      //               }),
      //           label: 'cart'),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
      //     ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Palette.secondarycolor.withOpacity(0.2),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 8, right: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              // width: 300,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  // shape: BoxShape.circle,
                                  border: Border.all(color: Palette.extracolor),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  SizedBox(width: 8),
                                  Icon(Icons.search),
                                  SizedBox(width: 8),
                                  Expanded(
                                      child: TextField(
                                    decoration: InputDecoration.collapsed(
                                        hintText: 'search'),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(CupertinoIcons.heart),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(CupertinoIcons.bell)
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.filter_alt_outlined),
                                Text('Filters'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Obx(
                                  () => DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value:
                                            favouritesController.selected.value,
                                        // focusColor: Colors.amber,
                                        iconSize: 42,
                                        items: const [
                                          DropdownMenuItem(
                                            child: Text('Ascending'),
                                            value: "Ascending",
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Descending'),
                                            value: "Descending",
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Price: Low to High'),
                                            value: "Low to High",
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Price: High to Low'),
                                            value: "High to Low",
                                          ),
                                        ],
                                        onChanged: (e) {
                                          favouritesController.selected.value =
                                              e.toString();
                                        }),
                                  ),
                                ),
                                Icon(Icons.sort_by_alpha_rounded),
                                Text('Sort')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.secondarycolor
                                          .withOpacity(0.4)),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.list_rounded,
                                      color: Palette.buttoncolor,
                                    ),
                                    onTap: () {
                                      Get.toNamed('categories');
                                    },
                                  ),
                                ),
                                Text('Categories')
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.secondarycolor
                                          .withOpacity(0.4)),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.star_border_purple500_outlined,
                                      color: Palette.buttoncolor,
                                    ),
                                    onTap: () {
                                      Get.toNamed('favourites');
                                    },
                                  ),
                                ),
                                Text('Favourites'),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.secondarycolor
                                          .withOpacity(0.4)),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.card_giftcard_rounded,
                                      color: Palette.buttoncolor,
                                    ),
                                    onTap: () {
                                      Get.toNamed('gifts');
                                    },
                                  ),
                                ),
                                Text('Gifts')
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.secondarycolor
                                          .withOpacity(0.4)),
                                  child: Icon(
                                    Icons.people_alt_outlined,
                                    color: Palette.buttoncolor,
                                  ),
                                ),
                                Text('Best Selling')
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Obx(() {
                            if (apiController.isLoading.value)
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            else
                              return
                                  // apiController.pData == null
                                  //     ? SizedBox()
                                  // :
                                  GridView.builder(
                                physics: BouncingScrollPhysics(),
                                // shrinkWrap: true,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1.0,
                                        crossAxisCount: 2),
                                itemCount: apiController.productList.length,

                                // pdController.photos.value.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    // child: GestureDetector(
                                    // onTap: () {
                                    // Get.toNamed('productinfo');
                                    // },
                                    child: Container(
                                      decoration: BoxDecoration(

                                          // color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Palette.secondarycolor
                                              .withOpacity(0.1),
                                          border: Border.all(
                                              color: Palette.secondarycolor)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              color: Colors.white,
                                            ),
                                            alignment: Alignment.center,
                                            height: 110,
                                            width: 200,
                                            child: ClipRRect(
                                              clipBehavior: Clip.none,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              child: Image.network(
                                                apiController
                                                    .productList[index].image,
                                                height: 120,
                                                width: 200,
                                              ),
                                              // Image.asset(pdController
                                              //     .photos.value[index]),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 42,
                                                          child: Text(
                                                            // pdController.products
                                                            //     .value[index],
                                                            apiController
                                                                .productList[
                                                                    index]
                                                                .title,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        behavior:
                                                            HitTestBehavior
                                                                .translucent,
                                                        child: Obx(
                                                          () => Icon(
                                                            favouritesController
                                                                    .number
                                                                    .contains(
                                                                        index)
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_border,
                                                            color: favouritesController
                                                                    .number
                                                                    .contains(
                                                                        index)
                                                                ? Colors.red
                                                                : Colors.black,
                                                            // size: 30,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          favouritesController
                                                                  .number
                                                                  .contains(
                                                                      index)
                                                              ? favouritesController
                                                                  .number
                                                                  .remove(index)
                                                              : favouritesController
                                                                  .number
                                                                  .add(index);
                                                          // print(index);

                                                          // favouritesController.
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    apiController
                                                        .productList[index]
                                                        .price
                                                        .toString(),
                                                    // pdController
                                                    //     .price.value[index],
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blue[700]),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                  // );
                                },
                              );
                          }),
                        ),
                        // Container(
                        //   height: 50,
                        //   width: MediaQuery.of(context).size.width,
                        //   decoration: BoxDecoration(
                        //       // borderRadius: BorderRadius.circular(12),
                        //       color: Colors.blue.withOpacity(0.2)),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children: [
                        //       Icon(Icons.home_rounded),
                        //       Icon(CupertinoIcons.heart),
                        //       Icon(Icons.shopping_cart),
                        //       Icon(Icons.person),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
