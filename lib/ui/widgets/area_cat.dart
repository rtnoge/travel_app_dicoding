import 'package:flutter/material.dart';

class Area extends StatelessWidget {
  final Function() onTap;
  final String areaName;
  final TextStyle style;
  final Color color;
  const Area(
      {Key? key,
      required this.onTap,
      required this.areaName,
      required this.style,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(areaName, style: style),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
