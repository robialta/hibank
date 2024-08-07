// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:hibank/data/model/article_model.dart';
import 'package:hibank/domain/entity/article_entity.dart';
import 'package:hibank/util/http/http_client.dart';
import 'package:hibank/util/http/http_util.dart';

class ArticleDatasource {
  final HttpClient httpClient;

  ArticleDatasource(this.httpClient);
  Future<List<ArticleEntity>> getArticles() async {
    try {
      Response response = await httpClient.dio.request(
        '/posts',
        options: Options(method: 'GET'),
      );
      return ArticleModel.buildArticleListFromJson((response));
    } on DioException catch (e) {
      throw HttpUtil.errorHandlingByStatusCode(e.response!.statusCode);
    } catch (e) {
      rethrow;
    }
  }

  Future<ArticleEntity> getArticlesById(int id) async {
    try {
      Response response = await httpClient.dio.request('/posts/$id');
      return ArticleModel.fromMap(response.data);
    } on DioException catch (e) {
      throw HttpUtil.errorHandlingByStatusCode(e.response!.statusCode);
    } catch (e) {
      rethrow;
    }
  }
}
