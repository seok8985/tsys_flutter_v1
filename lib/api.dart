// ignore_for_file: sort_child_properties_last

import 'package:app_flutter_v1/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;

const baseApiUrl = 'https://';

enum API {
  LOGIN,
  LOGOUT,
  REFRESH,
  GET_USER_INFO,
  UPDATE_FIREBASE_TOKEN,
  UPDATE_FILEBASE_SETTING,
  TEST
}

Map<API, String> apiMap = {
  API.LOGIN: '',
  API.LOGOUT: '',
  API.REFRESH: '',
  API.GET_USER_INFO: '',
  API.UPDATE_FIREBASE_TOKEN: '',
  API.UPDATE_FILEBASE_SETTING: '',
};

String getApi(API apiType, {String? suffix}) {
  String api = baseApiUrl;
  api += apiMap[apiType]!;
  if (suffix != null) api += '$suffix';
  return api;
}

Future<Dio> authDio(BuildContext context) async {
  var dio = Dio();

  final storage = new fss.FlutterSecureStorage();

  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    final accessToken = await storage.read(key: 'ACCESS_TOKEN');
    // request with accessToken
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }, onError: (error, handler) async {
    // when accessToken expired

    if (error.response?.statusCode == 401) {
      // request refreshing with refreshToken
      final accessToken = await storage.read(key: 'ACCESS_TOKEN');
      final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

      var refreshDio = Dio();
      refreshDio.interceptors.clear();
      refreshDio.interceptors
          .add(InterceptorsWrapper(onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          await storage.deleteAll();
          // Navigator.of(context).pushAndRemoveUntil(
          //     slidePageRouting(SignInScreen()),
          //     (Route<dynamic> route) => false);
          await _showLoginExpiredDialog(context);
        }
        return handler.next(error);
      }));

      // setting refreshDio options
      refreshDio.options.headers['Authorization'] = 'Bearer $accessToken';
      refreshDio.options.headers['Cookie'] = 'refresh_token=$refreshToken';

      // get refreshToken
      final refreshResponse = await refreshDio.get(getApi(API.REFRESH));

      // parsing tokens
      final newAccessToken = refreshResponse.headers['Authorization']![0];
      final newRefreshToken = refreshResponse.data['data']['refreshToken'];

      // update dio request headers token
      error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      // udpate secure storage token data
      await storage.write(key: 'ACCESS_TOKEN', value: newAccessToken);
      await storage.write(key: 'REFRESH_TOKEN', value: newRefreshToken);

      // create clonedRequest to request again
      final clonedRequest = await dio.request(error.requestOptions.path,
          options: Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers),
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters);

      return handler.resolve(clonedRequest);
    }
    return handler.next(error);
  }));
  return dio;
}

Future<void> _showLoginExpiredDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Center(
            child: Text('로그인 만료',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kDefaultFontColor),
                textAlign: TextAlign.center),
          ),
          content: Text("로그인이 만료되었습니다.\n다시 로그인 해주세요!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: kDefaultFontColor)),
          contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('확인', style: TextStyle(fontSize: 13)),
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(kShadowColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kThemeColor)),
              ),
            )
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
}
