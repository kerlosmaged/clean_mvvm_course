import 'package:advanced_arabic_mina_course/data%20layers/network/app_api.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/requests.dart';
import 'package:advanced_arabic_mina_course/data%20layers/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationRespose> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServicesClient _appServicesClient;
  RemoteDataSourceImpl(this._appServicesClient);

  @override
  Future<AuthenticationRespose> login(LoginRequest loginRequest) async {
    return await _appServicesClient.login(
        loginRequest.email, loginRequest.password);
  }
}
