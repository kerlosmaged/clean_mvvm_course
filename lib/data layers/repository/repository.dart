import 'package:advanced_arabic_mina_course/data%20layers/data_source/remote_data_source.dart';
import 'package:advanced_arabic_mina_course/data%20layers/mapper/mapper.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/error_handler.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/failuer.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/network_info.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/requests.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/model/models.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImple implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImple(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failuer, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // it mean the user mobile connected to internet , its safe call api

      try {
        final respons = await _remoteDataSource.login(loginRequest);

        if (respons.satutes == ApiEnternalStatus.success) {
          //success
          // return ethier success or right
          // return data
          return right(respons.toDomain());
        } else {
          //business error --failuer
          // return ethier failuer or left
          return left(
            Failuer(ApiEnternalStatus.failuer,
                respons.message ?? ResponseMessage.defulat),
          );
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failuer);
      }
    } else {
      // it mean the user mobile not connected to internet , this mean it is not safe so don't call api
      // return ethier failuer or left
      return left(DataSource.noInterNetConnection.getFailuer());
    }
  }
}
