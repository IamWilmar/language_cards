// To parse this JSON data, do
//
//     final wordsModel = wordsModelFromJson(jsonString);

import 'dart:convert';

VerbsModel wordsModelFromJson(String str) =>VerbsModel.fromJson(json.decode(str));

String wordsModelToJson(VerbsModel data) => json.encode(data.toJson());

class VerbsModel {
    String example;
    String infinitive;
    String pastParticiple;
    String simplePast;
    String verbEs;

    VerbsModel({
        this.example,
        this.infinitive,
        this.pastParticiple,
        this.simplePast,
        this.verbEs,
    });

    factory VerbsModel.fromJson(Map<String, dynamic> json) => VerbsModel(
        example: json["example"],
        infinitive: json["infinitive"],
        pastParticiple: json["past_participle"],
        simplePast: json["simple_past"],
        verbEs: json["verb_es"],
    );

    Map<String, dynamic> toJson() => {
        "example": example,
        "infinitive": infinitive,
        "past_participle": pastParticiple,
        "simple_past": simplePast,
        "verb_es": verbEs,
    };
}
