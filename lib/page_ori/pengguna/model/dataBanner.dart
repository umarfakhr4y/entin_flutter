// To parse this JSON data, do
//
//     final dataBanner = dataBannerFromJson(jsonString);

part of '../authModel.dart';
// To parse this JSON data, do
//
//     final dataBanner = dataBannerFromJson(jsonString);

// import 'dart:convert';

DataBanner dataBannerFromJson(String str) => DataBanner.fromJson(json.decode(str));

String dataBannerToJson(DataBanner data) => json.encode(data.toJson());

class DataBanner {
    List<Success> success;

    DataBanner({
        required this.success,
    });

    factory DataBanner.fromJson(Map<String, dynamic> json) => DataBanner(
        success: List<Success>.from(json["Success"].map((x) => Success.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Success": List<dynamic>.from(success.map((x) => x.toJson())),
    };
}

class Success {
    int id;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    Success({
        required this.id,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Success.fromJson(Map<String, dynamic> json) => Success(
        id: json["id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
