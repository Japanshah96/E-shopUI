import 'dart:developer';

import 'package:e_shop/controller/signup_controller.dart';
import 'package:e_shop/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller loginController = Get.put(Controller(), permanent: false);
    SignUpController signincontroller =
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
                            'LET\'S SIGN YOU IN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome back, You\'ve been missed',
                            style: TextStyle(color: Colors.grey[30]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'E-mail or Phone Number',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          CustomTextField(
                            onChange: (p0) {
                              signincontroller.logEmail.value = p0;
                              !p0.toString().contains('@')
                                  ? signincontroller.vali.value = true
                                  : signincontroller.vali.value = false;
                            },
                            // num: true,
                            hint: 'Enter E-mail or phone',
                            icon: Icons.phone_android,
                            icon1: Icons.download_done_rounded,
                            op: () {},
                          ),
                          Obx(() => signincontroller.vali.value == true
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
                                signincontroller.logPassword.value = p0;
                              },
                              obsecure: loginController.isEye.value,
                              hint: 'password',
                              icon: Icons.lock,
                              icon1: Icons.remove_red_eye_sharp,
                              op: () {
                                loginController.isEye.value =
                                    !loginController.isEye.value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(() => Checkbox(
                                      value: loginController.isDone.value,
                                      onChanged: (e) {
                                        loginController.isDone.value =
                                            !loginController.isDone.value;
                                      })),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Remember Me'),
                                ],
                              ),
                              Text('Forgot Password?'),
                            ],
                          ),
                          SizedBox(
                            height: 30,
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
                            buttonText: 'SIGN IN',
                            op: () {
                              if (signincontroller.logEmail.value == '' ||
                                  signincontroller.logPassword.value == '') {
                                return null;
                              } else {
                                signincontroller.signin();
                              }
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
                              Text('Don\'t have an Account?'),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Get.toNamed('/signup');
                                },
                                child: Text(
                                  'Signup',
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

class CustomTextField extends StatelessWidget {
  final VoidCallback op;
  final bool? obsecure;
  final String hint;
  final Function(String)? onChange;
  final Function(String?)? onSave;
  final String? Function(String?)? validate;
  final IconData? icon;
  final IconData? icon1;
  final bool? num;

  // final String? email;
  // final String? password;
  // final String? username;

  CustomTextField({
    Key? key,
    required this.hint,
    this.icon,
    this.icon1,
    this.obsecure = false,
    required this.op,
    this.onChange,
    // this.username,
    this.num,
    this.validate,
    this.onSave,
    // this.email,
    // this.password
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formkey,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(.3)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon == null ? SizedBox() : Icon(icon),
              SizedBox(width: 10),
              Container(
                child: Expanded(
                  child: TextFormField(
                    validator: validate,
                    onChanged: onChange,
                    onSaved: onSave,
                    obscureText: obsecure ?? false,
                    keyboardType: num == true ? TextInputType.number : null,
                    // keyboardType: TextInputType.number,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    // ],
                    decoration: InputDecoration.collapsed(
                      hintText: hint,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(onTap: op, child: Icon(icon1))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Gradient gradient;
  final String buttonText;
  final VoidCallback op;
  final double? height;
  final double? width;
  final double? borderRadius;

  // bool amIHovering = false;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.op,
    required this.gradient,
    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller buttonController = Get.put(Controller(), permanent: false);
    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      // hoverColor: Colors.amber,
      // focusColor: Colors.blue,
      // splashColor: Colors.red.withOpacity(0.4),

      onTap: op,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
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
