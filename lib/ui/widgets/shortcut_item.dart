import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/theme.dart';

class ShortCut extends StatelessWidget {
  final String title;
  final String img;
  const ShortCut({required this.img, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 8,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(img),
                  ),
                ),
              ),
              Text(
                title,
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          )
        : Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 8,
                height: MediaQuery.of(context).size.height / 8,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(img),
                  ),
                ),
              ),
              Text(
                title,
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          );
  }
}
