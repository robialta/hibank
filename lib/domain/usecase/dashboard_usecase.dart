// Project imports:
import 'package:hibank/data/repository/article_repository.dart';
import 'package:hibank/domain/entity/article_entity.dart';

class DashboardUseCase {
  final Articlerepository articlerepository;

  DashboardUseCase(this.articlerepository);

  Future<List<ArticleEntity>> getArticles() {
    return articlerepository.getArticles();
  }

  Future<ArticleEntity> searchById(int id) async {
    return await articlerepository.getArticleById(id);
  }
}
