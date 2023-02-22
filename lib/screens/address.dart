import 'package:e_shop/controller/address_controller.dart';
import 'package:e_shop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  AddressController addcontroller =
      Get.put(AddressController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        'Shipping Address',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your item will be delivered on below address',
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 25, right: 25),
                    child: Column(
                      children: [
                        Obx(
                          () => ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 130,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue.withOpacity(0.04)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          addcontroller.country[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          addcontroller.addresses[index],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          addcontroller.number[index],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: addcontroller.country.length),
                        ),
                        Spacer(),
                        CustomButton(
                            buttonText: 'Add Address',
                            op: () {
                              Get.toNamed('addaddress');
                            }),
                        SizedBox(
                          height: 50,
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
