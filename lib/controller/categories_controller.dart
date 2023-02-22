import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatController extends GetxController {
  RxList<IconData> categoryicons = <IconData>[
    Icons.camera_alt_outlined,
    Icons.volume_down_outlined,
    Icons.usb_sharp,
    Icons.gamepad_outlined,
    Icons.phone_android,
    Icons.laptop,
    Icons.battery_charging_full_rounded,
    CupertinoIcons.game_controller_solid,
    Icons.watch_sharp,
    Icons.screenshot_monitor,
    Icons.tv_outlined,
    Icons.cable,
  ].obs;
  RxList<String> categorynames = [
    'webcam',
    'sounds',
    'USB',
    'joystick',
    'phone',
    'laptop',
    'charger',
    'gamepad',
    'watches',
    'projector',
    'TV',
    'jack',
  ].obs;
}
