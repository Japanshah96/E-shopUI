import 'package:e_shop/controller/favourites_controller.dart';
import 'package:e_shop/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller cartController = Get.put(Controller(), permanent: false);
    FavouritesController atcController =
        Get.put(FavouritesController(), permanent: false);

    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     backgroundColor: Colors.blue.withOpacity(0.3),
      //     selectedItemColor: Colors.blue[700],
      //     unselectedItemColor: Colors.black,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //             child: Icon(Icons.home_rounded),
      //             onTap: () {
      //               Get.toNamed('product');
      //             },
      //           ),
      //           label: 'home'),
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
      body: SingleChildScrollView(
        child: Stack(
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 8, right: 8),
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
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 8),
                                        Icon(Icons.search),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: TextField(
                                            decoration:
                                                InputDecoration.collapsed(
                                                    hintText: 'search'),
                                          ),
                                        ),
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
                                Icon(CupertinoIcons.bell),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    Icon(Icons.sort_by_alpha_rounded),
                                    Text('Sort')
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15,
                              );
                            },
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: atcController.atc.value.length,
                            itemBuilder: (context, index) {
                              return Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    dismissible:
                                        DismissiblePane(onDismissed: () {
                                      atcController.atc.removeAt(index);
                                    }),
                                    children: [
                                      // SlidableAction(
                                      //   // flex: 1,
                                      //   onPressed: (context) {
                                      //     atcController.atc.add(
                                      //         atcController.number[index]);
                                      //     print(atcController.atc
                                      //         .toString());
                                      //   },
                                      //   backgroundColor: Colors.cyan,
                                      //   foregroundColor: Colors.white,
                                      //   icon: CupertinoIcons.cart,
                                      //   label: 'Add to Cart',
                                      // ),
                                      SlidableAction(
                                        onPressed: (context) {
                                          // favController.photos.value.removeAt(
                                          //     addfavController.number[index]);
                                          // favController.products.value
                                          //     .removeAt(addfavController
                                          //         .number[index]);
                                          // favController.price.value.removeAt(
                                          //     addfavController.number[index]);
                                          atcController.atc.removeAt(index);
                                        },
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ]),
                                child: Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomLeft: Radius.circular(15)),
                                          child: Image.asset(
                                            cartController.photos.value[
                                                atcController.atc[index]],
                                            fit: BoxFit.fill,
                                            height: 120,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartController.products.value[
                                                  atcController.atc[index]],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('Apple'),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.amber,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              cartController.price.value[
                                                  atcController.atc[index]],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
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
      ),
    );
  }
}
