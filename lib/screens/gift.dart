import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Gifts extends StatelessWidget {
  const Gifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gifts',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Select your Gift',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          )
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
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                      'https://img.freepik.com/premium-vector/happy-diwali-festival-light-gift-voucher-background_30996-3625.jpg?w=1060'),
                                ),
                              ),
                            );
                          }),
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
