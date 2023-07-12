import 'package:advanced_arabic_mina_course/data layers/network/failuer.dart';
import 'package:dio/dio.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forBidden,
  unAutheried,
  notFound,
  internelServerError,
  connectTimeOut,
  cancel,
  recieveTimeOut,
  sendTimeOut,
  cachError,
  noInterNetConnection,
  defulat,
  badCertificate,
  connectionTimeout,
}

class ErrorHandler implements Exception {
  late Failuer failuer;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // this is mean is error from api response os the api or from dio itself
      failuer = _handleError(error);
    } else {
      // default error
      failuer = DataSource.defulat.getFailuer();
    }
  }
}

Failuer _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.badCertificate:
      return DataSource.badCertificate.getFailuer();

    case DioErrorType.connectionTimeout:
      return DataSource.connectionTimeout.getFailuer();

    case DioErrorType.connectionError:
      return DataSource.noInterNetConnection.getFailuer();

    case DioErrorType.sendTimeout:
      return DataSource.sendTimeOut.getFailuer();

    case DioErrorType.receiveTimeout:
      return DataSource.recieveTimeOut.getFailuer();

    case DioErrorType.badResponse:
      if (error.response?.statusMessage != null &&
          error.response?.statusCode != null &&
          error.response != null) {
        return Failuer(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.defulat.getFailuer();
      }

    case DioErrorType.cancel:
      return DataSource.cancel.getFailuer();

    case DioErrorType.unknown:
      return DataSource.defulat.getFailuer();
  }
}

extension DataSourceExtension on DataSource {
  Failuer getFailuer() {
    // this in switch return values in datasource
    switch (this) {
      case DataSource.success:
        return Failuer(ResponseCode.success, ResponseMessage.success);

      case DataSource.badCertificate:
        return Failuer(
            ResponseCode.badCertificate, ResponseMessage.badCertificate);

      case DataSource.connectionTimeout:
        return Failuer(
            ResponseCode.connectionTimeout, ResponseMessage.connectionTimeout);

      case DataSource.noContent:
        return Failuer(ResponseCode.noContent, ResponseMessage.noContent);

      case DataSource.badRequest:
        return Failuer(ResponseCode.badRequest, ResponseMessage.badRequest);

      case DataSource.unAutheried:
        return Failuer(ResponseCode.unAutheried, ResponseMessage.unAutheried);

      case DataSource.notFound:
        return Failuer(ResponseCode.notFound, ResponseMessage.notFound);

      case DataSource.forBidden:
        return Failuer(ResponseCode.forBidden, ResponseMessage.forBidden);

      case DataSource.internelServerError:
        return Failuer(ResponseCode.internelServerError,
            ResponseMessage.internelServerError);

      case DataSource.connectTimeOut:
        return Failuer(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);

      case DataSource.cancel:
        return Failuer(ResponseCode.cancel, ResponseMessage.cancel);

      case DataSource.recieveTimeOut:
        return Failuer(
            ResponseCode.recieveTimeOut, ResponseMessage.recieveTimeOut);

      case DataSource.sendTimeOut:
        return Failuer(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);

      case DataSource.cachError:
        return Failuer(ResponseCode.cachError, ResponseMessage.cachError);

      case DataSource.noInterNetConnection:
        return Failuer(ResponseCode.noInterNetConnection,
            ResponseMessage.noInterNetConnection);

      case DataSource.defulat:
        return Failuer(ResponseCode.defulat, ResponseMessage.defulat);
    }
  }
}

class ResponseCode {
  static const int success = 200; //success with data
  static const int noContent = 201; //success with no data
  static const int badRequest = 400; // failuer , api rejected request
  static const int unAutheried = 401; //failuer , user is not authorised
  static const int forBidden = 403; // failuer , api rejected request
  static const int notFound = 404; //failuer , user is not authorised
  static const int internelServerError = 500; // crash in server side
  static const int badCertificate = 459;
  static const int connectionTimeout = 459;

  //local statues code
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int recieveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cachError = -5;
  static const int noInterNetConnection = -6;
  static const int defulat = -7;
}

class ResponseMessage {
  static const String success = "success"; //success with data
  static const String noContent = "success"; //success with no data
  static const String badRequest =
      "Bad Request , Try again later"; // failuer , api rejected request
  static const String unAutheried =
      "User UnAuthorised , Try again later"; //failuer , user is not authorised
  static const String forBidden =
      "forBidden request , Try again later"; // failuer , api rejected request
  static const String internelServerError =
      "some thing went wrong , Try again later"; // crash in server side
  static const String notFound = "not found"; // crash in server side
  static const String badCertificate =
      "Bad Certificate error"; // this is new error not found in mina course for bad certificate
  static const String connectionTimeout =
      "connection Time Out "; // this is new error not found in mina course for connection Time Out

  //local statues code
  static const String connectTimeOut = "Time Out Error , Try again later";
  static const String cancel = "request canceled , Try again later";
  static const String recieveTimeOut = "Time Out Error , Try again later";
  static const String sendTimeOut = "Time Out Error , Try again later";
  static const String cachError = "Cached Error , Try again later";
  static const String noInterNetConnection =
      "Please Check Your internet connection";
  static const String defulat = "Try again later";
}

class ApiEnternalStatus {
  static const int success = 0;
  static const int failuer = 1;
}
