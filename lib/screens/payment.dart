import 'package:e_shop/controller/login_controller.dart';
import 'package:e_shop/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller payController = Get.put(Controller(), permanent: false);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue.withOpacity(0.2),
          child: Column(children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Payment',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Add your payment method',
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
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              // color: Color.fromARGB(255, 157, 6, 232),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.asset('assets/images/CC.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Card Number'),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                num: true,
                                hint: 'Enter Card Number',
                                icon: Icons.pin_outlined,
                                icon1: Icons.download_done_rounded,
                                op: () {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('CardHolder Name'),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                hint: 'Enter CardHolder Name',
                                icon: Icons.person_pin_rounded,
                                // icon1: Icons.download_done_rounded,
                                op: () {},
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Month'),
                                        CustomTextField(
                                            hint: 'month',
                                            num: true,
                                            icon: Icons.calendar_month_outlined,
                                            op: () {})
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Year'),
                                        CustomTextField(
                                            num: true,
                                            hint: 'year',
                                            icon: Icons.calendar_month_outlined,
                                            op: () {})
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                        value: payController.isDone.value,
                                        onChanged: (e) {
                                          payController.isDone.value =
                                              !payController.isDone.value;
                                        }),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Remember this card details')
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                  buttonText: 'Buy Now',
                                  op: () {
                                    Get.dialog(Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                              'assets/images/smile.jpg'),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Your order has been placed sucessfully.',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ));
                                  }),
                              // Row(
                              //   children: [
                              //     Column(
                              //       children: [
                              //         Text('Month'),
                              //         Row(
                              //           children: [
                              //             Expanded(
                              //               child: CustomTextField(
                              //                 hint: 'Month',
                              //                 icon: Icons.calendar_month_outlined,
                              //                 icon1: Icons.download_done_rounded,
                              //                 op: () {},
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //     Column(
                              //       children: [
                              //         Text('Year'),
                              //         Row(
                              //           children: [
                              //             CustomTextField(
                              //               hint: 'Year',
                              //               icon: Icons.calendar_month_outlined,
                              //               icon1: Icons.download_done_rounded,
                              //               op: () {},
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ]),
        ),
        Positioned(
            top: 20,
            left: 10,
            child: GestureDetector(
              child: Icon(Icons.arrow_back_ios_new_rounded),
              onTap: () {
                Get.toNamed('profile');
              },
            ))
      ],
    ));
  }
}
