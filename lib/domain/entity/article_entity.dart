class ArticleEntity {
  final int userId;
  final int id;
  final String title;
  final String body;

  ArticleEntity(this.userId, this.id, this.title, this.body);

  List<ArticleEntity> toList() {
    return [this];
  }
}
