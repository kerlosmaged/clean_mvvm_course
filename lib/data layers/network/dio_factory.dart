import 'package:advanced_arabic_mina_course/application%20layers/app_prefs.dart';
import 'package:advanced_arabic_mina_course/application%20layers/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String _applicationJson = "application/json"; // headers json
const String _contentType = "content-type";
const String _accept = "accept";
const String _authorization = "authorization";
const String _defaultLanguage = "language";

class DioFactory {
  final AppPrefernces _appPrefernces;
  DioFactory(this._appPrefernces);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _appPrefernces.getAppLang();
    // ignore: no_leading_underscores_for_local_identifiers
    //apiTimeOut // this is 60000 millisecond equ => 1 min

    Map<String, String> headers = {
      _contentType: _applicationJson,
      _accept: _applicationJson,
      _authorization: Constants.token,
      _defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut),
    );

    if (!kReleaseMode) {
      // ignore: avoid_print
      print("No Logs In Release mode");
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
