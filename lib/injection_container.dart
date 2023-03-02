import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/api/dio_client.dart';
import 'core/local_database/daos/word_definitions_dao.dart';
import 'core/local_database/local_database.dart';
import 'core/network/network_info.dart';
import 'features/public_news/data/repositories/public_news_repository_impl.dart';
import 'features/public_news/domain/usecases/get_public_news_usecase.dart';
import 'features/public_news/domain/usecases/save_public_news_usecase.dart';
import 'features/public_news/presentation/bloc/public_news_bloc.dart';

import 'core/local_database/daos/public_news_dao.dart';
import 'features/public_news/data/datasources/remote/remotesource.dart';
import 'features/public_news/domain/repositories/public_news_repository.dart';

final sl = GetIt.instance;

void init() {
  core();
  blocs();
  usecases();
  datasources();
  repositories();
  externals();
}

core() {

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  sl.registerLazySingleton(() => DioClient());
}

void blocs() {
  // ! Public News
  sl.registerFactory(() => PublicNewsBloc(
        getPublicNewsUseCase: sl(),
        savePublicNewsUseCase: sl(),
      ));
}

void usecases() {
  // ! Public News
  sl.registerLazySingleton(() => GetPublicNewsUseCase(publicNewsRepository: sl()));
  sl.registerLazySingleton(() => SavePublicNewsUseCase(publicNewsRepository: sl()));
  }

void datasources() {
  // ! Public News
  sl.registerLazySingleton<PublicNewsRemoteDataSource>(
    () => PublicNewsRemoteDataSourceImpl(dioClient: sl()),
  );

  // ! Word Definition
  sl.registerLazySingleton<PublicNewsDao>(() => LocalDatabase().publicNewsDao);
  sl.registerLazySingleton<WordDefinitionsDao>(() => LocalDatabase().wordDefinitionsDao);
}

void repositories() {
  // ! Public News
  sl.registerLazySingleton<PublicNewsRepository>(() => PublicNewsRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
        publicNewsDao: sl(),
      ));
}

void externals() {}
