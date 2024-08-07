// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:hibank/domain/entity/article_entity.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel.fromMap(Map article)
      : super(article['userId'], article['id'], article['title'],
            article['body']);

  static List<ArticleEntity> buildArticleListFromJson(Response articles) {
    return articles.data
        .map<ArticleEntity>((jsonMap) => ArticleModel.fromMap(jsonMap))
        .toList();
  }
}
