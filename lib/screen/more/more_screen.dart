import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('menu'),
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [Text('more')],
        ),
      ),
    );
  }
}
