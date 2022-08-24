import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/theme.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final int radius;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.radius,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.toDouble()),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 16),
        ),
      ),
    );
  }
}
