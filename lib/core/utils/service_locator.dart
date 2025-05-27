import 'package:BookNest/Features/search/data/data_sources/remote_data_source/search_remote_data_source_impl.dart';
import 'package:BookNest/Features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/data_sources/local_data_source/home_local_data_source_impl.dart';
import '../../Features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
      HomeRemoteDataSourceImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRemoteDataSourceImpl>(
      SearchRemoteDataSourceImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>(),
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>()));

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
      searchRemoteDataSource: getIt.get<SearchRemoteDataSourceImpl>()));
}
