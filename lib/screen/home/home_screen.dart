// ignore_for_file: sized_box_for_whitespace, import_of_legacy_library_into_null_safe, unused_import, unused_field, library_private_types_in_public_api, prefer_final_fields

// import 'package:app_flutter_v1/model/banner.dart';
import 'package:app_flutter_v1/model/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  // List<T> map<T>(List list, Function handler){
  //   List<T> result = [];
  //   for(var i =0; i< list.length; i++){
  //       result.add(handler(i, list[i]));
  //   }
  // }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello. 이현석 님!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text('중소 입시학원에서 필요한 모든 기능을 갖춘 솔루션'),
              Text('튜터시스템입니다. '),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                child: Swiper(
                  onIndexChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  autoplay: true,
                  layout: SwiperLayout.DEFAULT,
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          banners[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ));
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                  child: Container(
                //padding: EdgeInsets.all(5),
                //color: Colors.grey[100],
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '바로가기',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '성적조회',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '학생의 성적을 조회합니다.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.more_horiz)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   padding: EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              //   child: Row(
              //     children: [
              //       Icon(Icons.favorite),
              //       SizedBox(width: 12),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             '성적조회',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold, fontSize: 16),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Text(
              //             '학생의 성적을 조회합니다.',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 14,
              //                 color: Colors.grey),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
