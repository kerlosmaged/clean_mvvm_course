import 'package:advanced_arabic_mina_course/application%20layers/di.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/common/state_renderer_folder/state_renderer_imp.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/login_screen/viewmodel/login_viewmodel.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/assets_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/color_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/routes_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/strings_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/values_manager.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final LoginViewModel _viewModel = instance<LoginViewModel>();

  final TextEditingController _userNameTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  // this is function for merge between viewModel and view
  _bind() {
    _viewModel.start(); // tell viewModel start your job

    _userNameTextController.addListener(
        () => _viewModel.setUserName(_userNameTextController.text));

    _passwordTextController.addListener(
        () => _viewModel.setPassword(_passwordTextController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _getContentWidget(),
                () {
                  _viewModel.login();
                },
              ) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: AppSize.s60, bottom: AppSize.s14),
                child: Center(
                  child: Image(
                    image: AssetImage(ImageAssetsManager.splashLogo),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outIsUserNameValid,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameTextController,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName,
                        labelText: AppStrings.userName,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.userNameError,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outIsPasswordValid,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        hintText: AppStrings.password,
                        labelText: AppStrings.password,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.passwordError,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: StreamBuilder<bool>(
                  stream: _viewModel.areAllInputsValidOutputs,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return SizedBox(
                      width: AppSize.s100,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                                _viewModel.login();
                              }
                            : null,
                        child: const Text(AppStrings.login),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s28,
                  right: AppSize.s28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.forgotPasswordRoute);
                      },
                      child: Text(
                        AppStrings.forgetPassword,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManager.rgisterRoute,
                        );
                      },
                      child: Text(
                        AppStrings.register,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
