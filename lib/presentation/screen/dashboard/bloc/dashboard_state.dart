// Project imports:
import 'package:hibank/domain/entity/article_entity.dart';

abstract class DashboardState {
  String? errorMessage;
  List<ArticleEntity>? articles;

  DashboardState({this.errorMessage, this.articles});
}

class DashboardInitState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardLoadedState extends DashboardState {
  DashboardLoadedState(List<ArticleEntity>? articles)
      : super(articles: articles);
}

class DashboardFailedState extends DashboardState {
  DashboardFailedState(String? error) : super(errorMessage: error);
}
