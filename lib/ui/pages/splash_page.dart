import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/get_started', (route) => false);
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 211,
              height: 211,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image_traveler.png')),
              ),
            ),
            Text(
              'TRAVELER',
              style: greenTextStyle.copyWith(
                letterSpacing: 3,
                fontSize: 45,
                fontWeight: bold,
              ),
            )
          ],
        )),
      ),
    );
  }
}
