// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
    String category;
    int datetime;
    String headline;
    int id;
    String image;
    String related;
    String source;
    String summary;
    String url;

    NewsModel({
        required this.category,
        required this.datetime,
        required this.headline,
        required this.id,
        required this.image,
        required this.related,
        required this.source,
        required this.summary,
        required this.url,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        category: json["category"],
        datetime: json["datetime"],
        headline: json["headline"],
        id: json["id"],
        image: json["image"],
        related: json["related"],
        source: json["source"],
        summary: json["summary"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "datetime": datetime,
        "headline": headline,
        "id": id,
        "image": image,
        "related": related,
        "source": source,
        "summary": summary,
        "url": url,
    };
}
