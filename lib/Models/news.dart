class News {
  final List articles;
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImg;
  final String publishedAt;
  final String content;

  News({this.articles,this.title,this.source,this.author,this.content,this.description,this.publishedAt,this.url,this.urlToImg});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      source: Source(id: json["source"]["id"] ?? "",name: json["source"]["name"] ?? ""),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ??"",
      url: json['url'] ?? "",
      urlToImg: json['urlToImage'] ??"",
      content: json['content'] ??""
    );
  }
}

class Source {
  String id;
  String name;
  Source({this.id,this.name});
}