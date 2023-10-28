// To parse this JSON data, do
//
//     final randomImageModel = randomImageModelFromJson(jsonString);

import 'dart:convert';

RandomImageModel randomImageModelFromJson(String str) =>
    RandomImageModel.fromJson(json.decode(str));

String randomImageModelToJson(RandomImageModel data) =>
    json.encode(data.toJson());

class RandomImageModel {
  String? message;
  String? status;

  RandomImageModel({
    this.message,
    this.status,
  });

  factory RandomImageModel.fromJson(Map<String, dynamic> json) =>
      RandomImageModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
