// To parse this JSON data, do
//
//     final dataRevRerata = dataRevRerataFromJson(jsonString);

import 'dart:convert';

DataRevRerata dataRevRerataFromJson(String str) => DataRevRerata.fromJson(json.decode(str));

String dataRevRerataToJson(DataRevRerata data) => json.encode(data.toJson());

class DataRevRerata {
    Data data;

    DataRevRerata({
        required this.data,
    });

    factory DataRevRerata.fromJson(Map<String, dynamic> json) => DataRevRerata(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String nameRestoran;
    String notelpRestoran;
    String alamatRestoran;
    String bannerRestoran;
    double ratingRestoranOverall;
    int usersId;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.nameRestoran,
        required this.notelpRestoran,
        required this.alamatRestoran,
        required this.bannerRestoran,
        required this.ratingRestoranOverall,
        required this.usersId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nameRestoran: json["name_restoran"],
        notelpRestoran: json["notelp_restoran"],
        alamatRestoran: json["alamat_restoran"],
        bannerRestoran: json["banner_restoran"],
        ratingRestoranOverall: json["rating_restoran_overall"]?.toDouble(),
        usersId: json["users_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_restoran": nameRestoran,
        "notelp_restoran": notelpRestoran,
        "alamat_restoran": alamatRestoran,
        "banner_restoran": bannerRestoran,
        "rating_restoran_overall": ratingRestoranOverall,
        "users_id": usersId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
