import 'package:bookly_app_project/Features/home/data/data_sources/local_data_source/home_local_data_source_impl.dart';
import 'package:bookly_app_project/Features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import 'package:bookly_app_project/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_project/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_project/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app_project/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
      HomeRemoteDataSourceImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeLocalDataSource: getIt.get<HomeLocalDataSourceImpl>(),
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImpl>()));
}
