// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

//하단 탭바
class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //배경
      child: Container(
        height: 50, //height
        child: TabBar(
          labelColor: Color.fromARGB(255, 28, 28, 28),
          unselectedLabelColor: Colors.black38,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 18,
              ),
              child: Text(
                '홈',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.web_stories,
                size: 18,
              ),
              child: Text(
                '마이서비스',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.snippet_folder,
                size: 18,
              ),
              child: Text(
                '자료실',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.question_answer,
                size: 18,
              ),
              child: Text(
                '질의응답',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.list,
                size: 18,
              ),
              child: Text(
                '전체',
                style: TextStyle(fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
