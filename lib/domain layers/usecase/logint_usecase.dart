import 'package:advanced_arabic_mina_course/data%20layers/network/failuer.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/requests.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/model/models.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/repository/repository.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failuer, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;

  String password;

  LoginUseCaseInput(this.email, this.password);
}
