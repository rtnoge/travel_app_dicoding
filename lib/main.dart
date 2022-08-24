import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/ui/pages/booked_done_page.dart';
import 'package:travel_app_dicoding/ui/pages/get_started_page.dart';
import 'package:travel_app_dicoding/ui/pages/main_page.dart';
import 'package:travel_app_dicoding/ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/get_started': (context) => GetStartedPage(),
        '/main_page': (context) => MainPage(),
        '/booked_done': (context) => BookedDone(),
      },
    );
  }
}
