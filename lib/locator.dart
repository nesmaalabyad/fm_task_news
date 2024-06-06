import 'package:get_it/get_it.dart';


import 'bloc/news_bloc.dart';
import 'services/news_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NewsService>(() => NewsService());
  getIt.registerFactory<NewsBloc>(() => NewsBloc(getIt<NewsService>()));
}
