// this is file is for Dependency Injection

import 'package:advanced_arabic_mina_course/application%20layers/app_prefs.dart';
import 'package:advanced_arabic_mina_course/data%20layers/data_source/remote_data_source.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/app_api.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/dio_factory.dart';
import 'package:advanced_arabic_mina_course/data%20layers/network/network_info.dart';
import 'package:advanced_arabic_mina_course/data%20layers/repository/repository.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/repository/repository.dart';
import 'package:advanced_arabic_mina_course/domain%20layers/usecase/logint_usecase.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/login_screen/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppMoudle() async {
  // app module , its a module where we put all generic Dependency injection in all app
  // shared Preferences this is a generic module

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  AppPrefernces appPrefernces = AppPrefernces(sharedPrefs);

  // instance.registerLazySingleton<AppPrefernces>(() => AppPrefernces(instance())); // this is way will return the instance auto from get_it
  // instance.registerLazySingleton<AppPrefernces>(() => AppPrefernces(instance<
  // SharedPreferences>())); // this is way will return the instance auto

  instance.registerLazySingleton<AppPrefernces>(() => appPrefernces);

  //network info instance
  // NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker());
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio factory instance

  // DioFactory dioFactory = DioFactory(instance());
  // instance.registerLazySingleton<DioFactory>(
  //     () => DioFactory(instance<AppPrefernces>()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client instance
  // this is app service client need to Dio

  Dio dio = await instance<DioFactory>().getDio();
  instance
      .registerLazySingleton<AppServicesClient>(() => AppServicesClient(dio));

  // remote data sorce instance

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServicesClient>()));

  //repository instance

  instance.registerLazySingleton<Repository>(() =>
      RepositoryImple(instance<NetworkInfo>(), instance<RemoteDataSource>()));
}

initLoginModule() {
  // prefers in any method not generic in appModule

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));

    instance.registerLazySingleton<LoginViewModel>(
        () => LoginViewModel(instance<LoginUseCase>()));
  }
}
