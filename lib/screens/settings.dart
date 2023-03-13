import 'package:e_shop/controller/signup_controller.dart';
import 'package:e_shop/pallete.dart';
import 'package:e_shop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController setController =
        Get.put(SignUpController(), permanent: false);
    return Scaffold(
      body: SingleChildScrollView(
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
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Change your details',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notification',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Obx(
                              () => Switch(
                                  value: setController.switch1.value,
                                  onChanged: (value) {
                                    setController.switch1.value = value;

                                    setController.switch1.value
                                        ? Get.snackbar(
                                            'Notification', 'Notification ON')
                                        : null;
                                  }),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(hint: 'Enter Username', op: () {}),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Street Address 2 (Optional)',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            hint: 'Enter Street Address 2 ', op: () {}),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'City',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(hint: 'Enter City ', op: () {}),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Zip Code',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            num: true, hint: 'Enter Zip Code', op: () {}),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            num: true, hint: 'Enter Phone Number', op: () {}),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 150,
                                child: CustomButton(
                                  buttonText: 'Update Password',
                                  op: () {
                                    Get.toNamed('password');
                                  },
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Palette.buttoncolor,
                                      Palette.secondarycolor
                                    ],
                                  ),
                                )),
                            Container(
                                width: 150,
                                child: CustomButton(
                                  buttonText: 'Save',
                                  op: () {},
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Palette.buttoncolor,
                                      Palette.secondarycolor
                                    ],
                                  ),
                                )),
                          ],
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
    );
  }
}
