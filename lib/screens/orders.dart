import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderScr extends StatelessWidget {
  const OrderScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 40, left: 8, right: 8),
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
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8),
                                      Icon(Icons.search),
                                      SizedBox(width: 8),
                                      Expanded(
                                          child: TextField(
                                        decoration: InputDecoration.collapsed(
                                            hintText: 'search'),
                                      ))
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
                              Icon(CupertinoIcons.bell)
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
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
