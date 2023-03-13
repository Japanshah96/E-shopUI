import 'package:e_shop/pallete.dart';
import 'package:e_shop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerifyScr extends StatelessWidget {
  const VerifyScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            'Verify your identity',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'We\'ve just sent you a code on (+91)9998887776',
                            style: TextStyle(color: Colors.grey[30]),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: OTPTextField(
                                length: 4,
                                otpFieldStyle: OtpFieldStyle(
                                    borderColor: Palette.buttoncolor),
                                width: MediaQuery.of(context).size.width,
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.box,
                              )),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Container(
                          //       child: TextField(),
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.rectangle,
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: Colors.grey[300],
                          //       ),
                          //     ),
                          //     Container(
                          //       child: TextField(),
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.rectangle,
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: Colors.grey[300],
                          //       ),
                          //     ),
                          //     Container(
                          //       child: TextField(),
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.rectangle,
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: Colors.grey[300],
                          //       ),
                          //     ),
                          //     Container(
                          //       child: TextField(),
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.rectangle,
                          //         borderRadius: BorderRadius.circular(10),
                          //         color: Colors.grey[300],
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('I didn\'t recieve code.'),
                              Text(
                                'Recieve Code',
                                style: TextStyle(
                                    color: Palette.buttoncolor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Spacer(),
                          CustomButton(
                            buttonText: 'NEXT',
                            op: () {
                              Get.toNamed('/homescreen');
                            },
                            gradient: LinearGradient(
                              colors: <Color>[
                                Palette.buttoncolor,
                                Palette.secondarycolor
                              ],
                            ),
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
