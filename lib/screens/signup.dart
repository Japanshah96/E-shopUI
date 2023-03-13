import 'package:e_shop/controller/login_controller.dart';
import 'package:e_shop/controller/signup_controller.dart';
import 'package:e_shop/pallete.dart';
import 'package:e_shop/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController =
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
                ),
              ),
              Expanded(
                flex: 3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.all(50),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),

                          Text(
                            'Create a new account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Text(
                          //   'Welcome back, You\'ve been missed',
                          //   style: TextStyle(color: Colors.grey[30]),
                          // ),
                          CustomTextField(
                            onChange: (p0) {
                              signUpController.username.value = p0;
                            },
                            validate: (p0) {
                              if (p0.toString().length < 3) {
                                return 'Minimum 3 letter name is required';
                              } else {
                                return null;
                              }
                            },
                            onSave: (value) {
                              signUpController.username.value =
                                  value.toString();
                            },
                            hint: 'Enter Name',
                            icon: Icons.person_pin_rounded,
                            icon1: Icons.download_done_rounded,
                            op: () {},
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email or Phone Number',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          CustomTextField(
                            onChange: (p0) {
                              signUpController.email.value = p0;

                              !p0.toString().contains('@')
                                  ? signUpController.vali.value = true
                                  : signUpController.vali.value = false;
                            },
                            validate: (p0) {
                              // if (!(p0.toString().contains('@'))) {
                              //   return 'Invalid E-mail';
                              // } else {
                              //   return null;
                              // }
                            },
                            onSave: (value) {
                              signUpController.email.value = value.toString();
                            },

                            // num: true,
                            hint: 'Enter E-mail or phone',
                            icon: Icons.phone_android,
                            icon1: Icons.download_done_rounded,
                            op: () {},
                          ),
                          Obx(() => signUpController.vali.value == true
                              ? Text(
                                  'Invalid E-mail',
                                  style: TextStyle(color: Colors.red),
                                )
                              : SizedBox()),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Obx(
                            () => CustomTextField(
                              onChange: (p0) {
                                signUpController.password.value = p0;
                              },
                              validate: (p0) {
                                if (p0.toString().length < 6) {
                                  return 'Password is so small';
                                } else {
                                  return null;
                                }
                              },
                              onSave: (value) {
                                signUpController.password.value =
                                    value.toString();
                              },
                              obsecure: signUpController.isEye.value,
                              hint: 'password',
                              icon: Icons.lock,
                              icon1: Icons.remove_red_eye_sharp,
                              op: () {
                                signUpController.isEye.value =
                                    !signUpController.isEye.value;
                              },
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text('Or sign in with social account?'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/images/google_icon.png'),
                              Image.asset('assets/images/fb_icon.png'),
                            ],
                          ),
                          Spacer(),
                          CustomButton(
                            buttonText: 'SIGN UP',
                            op: () {
                              if (signUpController.username.value == '' ||
                                  signUpController.email.value == '' ||
                                  signUpController.password.value == '') {
                                print('object123');
                                return null;
                              } else {
                                print('object');
                                signUpController.signup();
                              }
                              // if (signUpController.formkey.currentState!
                              //     .validate()) {
                              //   signUpController.formkey.currentState!.save();
                              // }
                            },
                            gradient: LinearGradient(
                              colors: <Color>[
                                Palette.buttoncolor,
                                Palette.secondarycolor
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an Account?'),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.primarycolor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      // left: MediaQuery.of(context).size.width * .5 - 40,
                      top: -50,
                      // child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 8, color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.person, size: 65),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
