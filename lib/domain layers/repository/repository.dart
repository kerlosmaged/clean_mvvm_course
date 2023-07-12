import 'package:advanced_arabic_mina_course/data%20layers/network/failuer.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/requests.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failuer, Authentication>> login(LoginRequest loginRequest);
}
