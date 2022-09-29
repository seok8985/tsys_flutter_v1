import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

const kThemeColor = Color(0xFF29a7e1);
const kScaffoldBackgroundColor = Color(0xFFfcfeff);
final kShadowColor = Color(0xFF90abb7).withOpacity(0.3);
const kDefaultFontColor = Color(0xFF001924);
const kLiteFontColor = Color(0xFF849197);
const kLogoColor = Color(0xFF2ca6e0);
const kDefaultPadding = 15.0;
const kDefaultNumberSliderDuration = Duration(seconds: 1);
const kAppUrlScheme = 'com.rocketdan.ssoda';
const kNewImagePrefix = 'HASHCHECKER_NEW_IMAGE';
const kRewardPolicyRandom = 'RANDOM';
const kRewardPolicyFollow = 'FOLLOW';

Future<void> showProgressDialog(
    BuildContext context, Future<dynamic> future) async {
  await showDialog(
      context: context, builder: (context) => FutureProgressDialog(future));
}

Widget buildErrorPage({String? message}) {
  return Center(
    child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Icon(Icons.wifi_off_rounded, color: kDefaultFontColor),
          SizedBox(height: kDefaultPadding),
          Text(message ?? '정보를 가져올 수 없습니다.\n인터넷 연결 상태를 확인해주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.2, color: kLiteFontColor))
        ])),
  );
}
