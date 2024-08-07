// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:hibank/domain/entity/article_entity.dart';
import 'package:hibank/domain/usecase/dashboard_usecase.dart';
import 'package:hibank/presentation/screen/dashboard/bloc/dashboard_state.dart';

class DashBoardBloc extends Cubit<DashboardState> {
  final DashboardUseCase dashboardUseCase;
  DashBoardBloc(this.dashboardUseCase) : super(DashboardInitState());

  Future<void> getArticles() async {
    try {
      emit(DashboardLoadingState());
      List<ArticleEntity> articles = await dashboardUseCase.getArticles();
      emit(DashboardLoadedState(articles));
    } catch (e) {
      DashboardFailedState(e.toString());
    }
  }

  Future<void> searchById(String id) async {
    if (id == '') {
      getArticles();
    } else {
      try {
        emit(DashboardLoadingState());
        final ArticleEntity articles =
            await dashboardUseCase.searchById(int.parse(id));
        emit(DashboardLoadedState(articles.toList()));
      } catch (e) {
        emit(DashboardFailedState(e.toString()));
      }
    }
  }
}
