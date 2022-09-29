// ignore_for_file: avoid_returning_null_for_void, avoid_print

import 'package:flutter/material.dart';

// 상단바 -- 현재 사용안함
class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final Size prefSize;
  final String title;
  final String position;
  //final Image title; //이미지로
  final bool isSubPage;
  final bool hasSearchFunction;

  CustomAppBar(
      {required this.title,
      this.position = 'center',
      this.isSubPage = false,
      this.hasSearchFunction = false,
      this.prefSize = const Size.fromHeight(50.0),
      Key? key})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleTextStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
      actionsIconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0, //아래 라인제거
      centerTitle: widget.position == 'center' ? true : false,
      title: Text(widget.title),
      automaticallyImplyLeading: false,
      leading: widget.isSubPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => null,
            )
          : null, //뒤로가기
      actions: [
        widget.hasSearchFunction
            ? IconButton(onPressed: () => null, icon: const Icon(Icons.search))
            : const Icon(null),
        IconButton(
          onPressed: () {
            print("Don't poke me!!");
          },
          icon: Stack(
            children: [
              Icon(
                Icons.notifications,
                size: 19,
              ),
              //새로운 알림 표시
              // Positioned(
              //     child: Icon(
              //   Icons.brightness_1,
              //   color: Colors.red,
              //   size: 7.0,
              // ))
            ],
          ),
        ),
      ],
      //알람
    );
  }
}
