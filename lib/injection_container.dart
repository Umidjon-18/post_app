import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:post_app/core/api/dio_client.dart';
import 'package:post_app/core/network/network_info.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';
import 'package:post_app/features/public_news/data/repositories/public_news_repository_impl.dart';
import 'package:post_app/features/public_news/domain/usecases/delete_public_news_usecase.dart';
import 'package:post_app/features/public_news/domain/usecases/get_public_news_usecase.dart';
import 'package:post_app/features/public_news/domain/usecases/save_public_news_usecase.dart';
import 'package:post_app/features/public_news/presentation/bloc/public_news_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/public_news/data/datasources/remote/remotesource.dart';
import 'features/public_news/domain/repositories/public_news_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await core();
  blocs();
  usecases();
  datasources();
  repositories();
  externals();
}

Future<void> core() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  sl.registerLazySingleton<SharedPreferences>(() => preferences);
  sl.registerLazySingleton(() => DioClient());
}

void blocs() {
  sl.registerFactory(() => PublicNewsBloc(
        getPublicNewsUseCase: sl(),
        deletePublicNewsUseCase: sl(),
        savePublicNewsUseCase: sl(),
      ));
}

void usecases() {
  // ! Public News
  sl.registerLazySingleton(() => GetPublicNewsUseCase(publicNewsRepository: sl()));
  sl.registerLazySingleton(() => DeletePublicNewsUseCase(localDataSource: sl()));
  sl.registerLazySingleton(() => SavePublicNewsUseCase(publicNewsRepository: sl()));
}

void datasources() {
  // ! Public News
  sl.registerLazySingleton(() => PublicNewsLocalDataSource(preferences: sl()));
  sl.registerLazySingleton<PublicNewsRemoteDataSource>(
    () => PublicNewsRemoteDataSourceImpl(dioClient: sl()),
  );
}

void repositories() {
  // ! Public News
  sl.registerLazySingleton<PublicNewsRepository>(() => PublicNewsRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
}

void externals() {}
