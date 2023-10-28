// To parse this JSON data, do
//
//     final listByBreedModel = listByBreedModelFromJson(jsonString);

import 'dart:convert';

ListByBreedModel listByBreedModelFromJson(String str) =>
    ListByBreedModel.fromJson(json.decode(str));

String listByBreedModelToJson(ListByBreedModel data) =>
    json.encode(data.toJson());

class ListByBreedModel {
  List<String>? message;
  String? status;

  ListByBreedModel({
    this.message,
    this.status,
  });

  factory ListByBreedModel.fromJson(Map<String, dynamic> json) =>
      ListByBreedModel(
        message: json["message"] == null
            ? []
            : List<String>.from(json["message"]!.map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message":
            message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
        "status": status,
      };
}
