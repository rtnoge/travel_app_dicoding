import 'package:flutter/material.dart';
import 'package:travel_app_dicoding/theme.dart';

class OverviewItem extends StatelessWidget {
  final String title;
  final String duration;
  final IconData icon;
  final Color color;
  const OverviewItem(
      {Key? key,
      required this.title,
      required this.duration,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 16,
            ),
            SizedBox(width: 5),
            Text(
              duration,
              style: blackTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: greyTextStyle,
        ),
      ],
    );
  }
}
