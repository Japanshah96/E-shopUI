import 'package:e_shop/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      'Change Password',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Change your password from here',
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
                      // mainAxisAlignment: MainAxisAlignment.center ,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 160,
                        ),
                        Text(
                          'Old Password',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        CustomTextField(hint: 'Enter Old Password', op: () {}),
                        Text(
                          'New Password',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        CustomTextField(hint: 'Enter New Password', op: () {}),
                        SizedBox(
                          height: 180,
                        ),
                        CustomButton(buttonText: 'Submit', op: () {}),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
