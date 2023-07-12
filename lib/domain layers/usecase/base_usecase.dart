import 'package:advanced_arabic_mina_course/data%20layers/network/failuer.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failuer, Out>> execute(In input);
}
