// To parse this JSON data, do
//
//     final examplesModel = examplesModelFromJson(jsonString);

import 'dart:convert';

ExamplesModel examplesModelFromJson(String str) => ExamplesModel.fromJson(json.decode(str));

String examplesModelToJson(ExamplesModel data) => json.encode(data.toJson());

class ExamplesModel {
    String afirmacion;
    String interrogacion;
    String negacion;

    ExamplesModel({
        this.afirmacion,
        this.interrogacion,
        this.negacion,
    });

    factory ExamplesModel.fromJson(Map<String, dynamic> json) => ExamplesModel(
        afirmacion: json["afirmacion"],
        interrogacion: json["interrogacion"],
        negacion: json["negacion"],
    );

    Map<String, dynamic> toJson() => {
        "afirmacion": afirmacion,
        "interrogacion": interrogacion,
        "negacion": negacion,
    };
}
