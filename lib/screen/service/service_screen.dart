// ignore_for_file: avoid_unnecessary_containers

import 'package:app_flutter_v1/widget/custom_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: 30,
        margin: EdgeInsets.only(left: 14, top: 20),
        child: DefaultTabController(
          length: 3,
          child: TabBar(
              labelPadding: EdgeInsets.only(left: 14, right: 14),
              indicatorPadding: EdgeInsets.only(left: 14, right: 14),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black26,
              labelStyle:
                  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
              unselectedLabelStyle:
                  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
              indicator: RoundedRectangleTabIndicator(
                  color: Colors.black, weight: 2.4, width: 25),
              tabs: [
                Tab(
                  child: Container(
                    child: Text('출석조회'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('성적조회'),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text('채점조회'),
                  ),
                )
              ]),
        ),
      )),
    );
  }
}
