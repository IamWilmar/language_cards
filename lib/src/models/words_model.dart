// To parse this JSON data, do
//
//     final wordsModel = wordsModelFromJson(jsonString);

import 'dart:convert';

WordsModel wordsModelFromJson(String str) => WordsModel.fromJson(json.decode(str));

String wordsModelToJson(WordsModel data) => json.encode(data.toJson());

class WordsModel {
    String id;
    String wordEn;
    String wordEs;
    String url;
    String category;

    WordsModel({
        this.id,
        this.wordEn,
        this.wordEs,
        this.url,
        this.category,
    });

    factory WordsModel.fromJson(Map<String, dynamic> json) => WordsModel(
        id: json["id"],
        wordEn: json["word_en"],
        wordEs: json["word_es"],
        url: json["url"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "word_en": wordEn,
        "word_es": wordEs,
        "url": url,
        "category": category,
    };
}
