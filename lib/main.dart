// ignore_for_file: depend_on_referenced_packages

import 'package:app_flutter_v1/screen/home/home_screen.dart';
import 'package:app_flutter_v1/screen/more/more_screen.dart';
import 'package:app_flutter_v1/screen/service/service_screen.dart';
import 'package:app_flutter_v1/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SystemApp());
}

class SystemApp extends StatefulWidget {
  const SystemApp({super.key});

  @override
  State<SystemApp> createState() => _SystemAppState();
}

class _SystemAppState extends State<SystemApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutor System',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      home: DefaultTabController(
        //TAB
        length: 5,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(), // 화면 좌우 스크롤안되게
            children: [
              HomeScreen(),
              ServiceScreen(),
              Container(
                child: Center(
                  child: Text('file'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('qna'),
                ),
              ),
              MoreScreen()
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
