// Project imports:
import 'package:hibank/data/datasource/api/article_datasource.dart';
import 'package:hibank/domain/entity/article_entity.dart';

class Articlerepository {
  final ArticleDatasource articleDatasource;

  Articlerepository(this.articleDatasource);

  Future<List<ArticleEntity>> getArticles() => articleDatasource.getArticles();

  Future<ArticleEntity> getArticleById(int id) async {
    return articleDatasource.getArticlesById(id);
  }
}
