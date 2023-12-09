// To parse this JSON data, do
//
//     final dataRating = dataRatingFromJson(jsonString);

import 'dart:convert';

DataRating dataRatingFromJson(String str) => DataRating.fromJson(json.decode(str));

String dataRatingToJson(DataRating data) => json.encode(data.toJson());

class DataRating {
    List<Datum> data;

    DataRating({
        required this.data,
    });

    factory DataRating.fromJson(Map<String, dynamic> json) => DataRating(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int usersId;
    String name;
    String image;
    String ulasan;
    double ratingRestoran;
    DateTime createdAt;

    Datum({
        required this.usersId,
        required this.name,
        required this.image,
        required this.ulasan,
        required this.ratingRestoran,
        required this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        usersId: json["users_id"],
        name: json["name"],
        image: json["image"],
        ulasan: json["ulasan"],
        ratingRestoran: json["rating_restoran"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "users_id": usersId,
        "name": name,
        "image": image,
        "ulasan": ulasan,
        "rating_restoran": ratingRestoran,
        "created_at": createdAt.toIso8601String(),
    };
}
