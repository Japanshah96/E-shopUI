// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:e_shop/screens/add_address.dart';
import 'package:e_shop/screens/address.dart';
import 'package:e_shop/screens/cart.dart';
import 'package:e_shop/screens/categories.dart';
import 'package:e_shop/screens/favourites.dart';
import 'package:e_shop/screens/gift.dart';
import 'package:e_shop/screens/homescreen.dart';
import 'package:e_shop/screens/login.dart';
import 'package:e_shop/screens/orders.dart';
import 'package:e_shop/screens/payment.dart';
import 'package:e_shop/screens/product_info.dart';
import 'package:e_shop/screens/products.dart';
import 'package:e_shop/screens/profile.dart';
import 'package:e_shop/screens/settings.dart';
import 'package:e_shop/screens/signup.dart';
import 'package:e_shop/screens/splash.dart';
import 'package:e_shop/screens/update_password.dart';
import 'package:e_shop/screens/verifty.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shop',

      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyApp(),
        ),
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            transition: Transition.leftToRight),
        GetPage(name: '/signup', page: () => const SignUp()),
        GetPage(name: '/verify', page: () => const VerifyScr()),
        GetPage(name: '/product', page: () => const ProductScreen()),
        GetPage(name: '/productinfo', page: () => const ProductInfo()),
        GetPage(name: '/payment', page: () => const PaymentPage()),
        GetPage(name: '/categories', page: () => const Categories()),
        GetPage(name: '/favourites', page: () => const Favourites()),
        GetPage(name: '/gifts', page: () => const Gifts()),
        GetPage(name: '/homescreen', page: () => const HomePage()),
        GetPage(name: '/profile', page: () => Profile()),
        GetPage(name: '/cart', page: () => const Cart()),
        GetPage(name: '/address', page: () => Address()),
        GetPage(name: '/addaddress', page: () => AddAddress()),
        GetPage(name: '/setting', page: () => const Settings()),
        GetPage(name: '/password', page: () => const UpdatePassword()),
        GetPage(name: '/orders', page: () => const OrderScr()),
      ],
      // theme: ThemeData,
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher')));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        'Testing $_counter',
        'How you doin ?',
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showNotification,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
