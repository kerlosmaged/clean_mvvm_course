import 'dart:async';

// import 'package:freezed/builder.dart';// freezed package used for data class

import 'package:advanced_arabic_mina_course/domain%20layers/usecase/logint_usecase.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/Base/base_view_model.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/common/freezed_data.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/common/state_renderer_folder/state_renderer.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/common/state_renderer_folder/state_renderer_imp.dart';

class LoginViewModel extends BasedViewModel
    with LoginViewModelInputs, LoginViewModelsOutputs {
  final StreamController _userNameStreamController = StreamController<
      String>.broadcast(); // this is broadcast make my streamcontroller has many listeners

  final StreamController _passwordStreamController = StreamController<
      String>.broadcast(); // this is broadcast make my streamcontroller has many listeners

  final StreamController _areInputsValidStreamController = StreamController<
      void>.broadcast(); // this is broadcast make my streamcontroller has many listeners

  var loginObject =
      LoginObject("", ""); //by defult this is userName and Password is empty

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  // inputs from user
  @override
  void dispose() {
    super.dispose();
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areInputsValidStreamController.close();
  }

  @override
  void start() {
    //view model should tell view please show content state
    inputState.add(ContentState());
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get areAllInputsValidInputs => _areInputsValidStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password:
            password); // this is make update for login object after user enter input password
    areAllInputsValidInputs.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(
        userName:
            userName); // this is make update for login object after user enter input username
  }

  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold(
      (failuer) => {
        //left failure
        inputState.add(ErrorState(
          StateRendererType.popupErrorState,
          failuer.message,
        )),
        print(failuer.message)
      },
      (data) => {
        //right or data (success)
        // navigate to main screen
        inputState.add(ContentState()),
        print(data.contacts)
      },
    );
  }

  // outputs for user

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get areAllInputsValidOutputs =>
      _areInputsValidStreamController.stream.map((_) => _areInputsValid());

  //  this is function for check in stream and return valid or not for password and user name

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }
}

mixin LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get areAllInputsValidInputs;
  Sink get inputUserName;
  Sink get inputPassword;
}

mixin LoginViewModelsOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get areAllInputsValidOutputs;
}
