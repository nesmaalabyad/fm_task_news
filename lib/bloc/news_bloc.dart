import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/article.dart';
import '../services/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;

  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
  }

  void _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final articles = await newsService.fetchTopHeadlines();
      emit(NewsLoaded(articles: articles));
    } catch (e) {
      print('Error: $e');
      emit(NewsError(message: 'Failed to fetch news'));
    }
  }
}
