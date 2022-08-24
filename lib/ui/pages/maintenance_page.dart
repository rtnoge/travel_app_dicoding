import 'package:flutter/material.dart';

class MaintenancePage extends StatelessWidget {
  final String? title;
  MaintenancePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('${title} Page on maintenance'),
          ),
        ),
      ),
    );
  }
}
