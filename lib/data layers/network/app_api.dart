
import 'package:advanced_arabic_mina_course/application layers/constants.dart';
import 'package:advanced_arabic_mina_course/data%20layers/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) = _AppserviceClient;
  @POST("/customer/login")
  Future<AuthenticationRespose> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
