import 'package:e_shop/controller/address_controller.dart';
import 'package:e_shop/pallete.dart';
import 'package:e_shop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  AddressController addaddresscontroller =
      Get.put(AddressController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add New Address',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Please enter your new address',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Country or Region',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomDropDown(),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Street Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              hint: 'Enter Street Address',
                              icon: Icons.location_city_outlined,
                              onChange: (value) {
                                addaddresscontroller.nameAddress.value = value;
                              },
                              op: () {}),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Street Address (Optional)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hint: 'Enter Street Address2',
                            icon: Icons.location_city_outlined,
                            op: () {},
                            onChange: (value) {
                              // addaddresscontroller.addresses.value.add(value.toString());
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Contact Number',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hint: 'Enter Contact Number',
                            icon: Icons.phone,
                            num: true,
                            op: () {
                              ;
                            },
                            onChange: (value) {
                              addaddresscontroller.nameNumber.value = value;
                            },
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          // Spacer(),
                          CustomButton(
                            buttonText: 'Save',
                            op: () {
                              addaddresscontroller.country
                                  .add(addaddresscontroller.nameCountry.value);
                              addaddresscontroller.addresses
                                  .add(addaddresscontroller.nameAddress.value);
                              addaddresscontroller.number
                                  .add(addaddresscontroller.nameNumber.value);
                              print(addaddresscontroller.country.toString());

                              Get.back();
                              addaddresscontroller.nameCountry.value = '';
                              addaddresscontroller.nameAddress.value = '';
                              addaddresscontroller.nameNumber.value = '';
                            },
                            gradient: LinearGradient(
                              colors: <Color>[
                                Palette.buttoncolor,
                                Palette.secondarycolor
                              ],
                            ),
                          ),
                          // Spacer(),
                          // SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
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

class CustomDropDown extends StatefulWidget {
  AddressController addaddresscontroller =
      Get.put(AddressController(), permanent: false);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  AddressController addaddresscontroller =
      Get.put(AddressController(), permanent: false);
  @override
  List<String> items = [
    'United States',
    "United Kingdom",
    "India",
    'Africa',
    'Australia',
    "Afganistan"
  ];
  String? selectedItem = 'India';
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 3, color: Colors.blue))),
          value: selectedItem,
          items: items
              .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 15),
                  )))
              .toList(),
          onChanged: (String? value) {
            setState(() {
              selectedItem = value;
              addaddresscontroller.nameCountry.value = value!;
              // addaddresscontroller.country.value.add(value.toString());
            });
          }),
    );
  }
}
