// To parse this JSON data, do
//
//     final grammarModel = grammarModelFromJson(jsonString);

import 'dart:convert';

GrammarModel grammarModelFromJson(String str) => GrammarModel.fromJson(json.decode(str));

String grammarModelToJson(GrammarModel data) => json.encode(data.toJson());

class GrammarModel {
    String estructure;
    String explanation;

    GrammarModel({
        this.estructure,
        this.explanation,
    });

    factory GrammarModel.fromJson(Map<String, dynamic> json) => GrammarModel(
        estructure: json["estructure"],
        explanation: json["explanation"],
    );

    Map<String, dynamic> toJson() => {
        "estructure": estructure,
        "explanation": explanation,
    };
}
