import 'dart:io';

import 'package:e_shop/controller/profile_controller.dart';
import 'package:e_shop/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  ProfileCont profileCont = Get.put(ProfileCont(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Palette.secondarycolor.withOpacity(0.2),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Obx(
                                    () => ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: profileCont
                                                    .selectedImagePath.value ==
                                                ''
                                            ? Image.asset(
                                                'assets/images/smile.jpg')
                                            : Image.file(
                                                File(profileCont
                                                    .selectedImagePath.value),
                                              )),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                              color: Colors.white,
                                              child: Icon(Icons.camera_alt)),
                                        ),
                                      ),
                                      onTap: () {
                                        Get.bottomSheet(Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          height: 180,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.camera,
                                                      size: 50,
                                                    ),
                                                    onTap: () {
                                                      profileCont.getImage(
                                                          ImageSource.camera);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text('From Camera')
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.photo,
                                                      size: 50,
                                                    ),
                                                    onTap: () {
                                                      profileCont.getImage(
                                                          ImageSource.gallery);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text('From Gallery')
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                      },
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Jack Ryan',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'jackryan69@gmail.com',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54),
                                ),
                              ],
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 12, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('orders');
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white70),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My Orders',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Already have 12 orders'),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('address');
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white70),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Shipping addresses',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('3 addresses'),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('payment');
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white70),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Payment Methods',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Visa **34'),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('setting');
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white70),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Settings',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Notifications, password'),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    size: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Obx(
                            () => EditedCustomButton(
                              loading: profileCont.isLoading.value,
                              buttonText:
                                  profileCont.isLoading.value ? '' : 'Upload',
                              op: () {
                                profileCont.isLoading.value
                                    ? null
                                    : profileCont.uploadFile();
                              },
                              icon: Icons.upload,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditedCustomButton extends StatelessWidget {
  final Gradient? gradient;
  final String buttonText;
  final VoidCallback op;
  final bool? loading;
  final IconData? icon;
  // final Object? icon;
  const EditedCustomButton({
    Key? key,
    required this.buttonText,
    required this.op,
    this.gradient,
    this.icon,
    this.loading,
    // this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCont newButtonCont = Get.put(ProfileCont(), permanent: false);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: op,
      child: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading == true ? CircularProgressIndicator() : Icon(icon),
              Text(
                buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: gradient,
            color: Palette.buttoncolor,
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
