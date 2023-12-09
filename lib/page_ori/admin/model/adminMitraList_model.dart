// To parse this JSON data, do
//
//     final adminListMitra = adminListMitraFromJson(jsonString);

import 'dart:convert';

AdminListMitra adminListMitraFromJson(String str) => AdminListMitra.fromJson(json.decode(str));

String adminListMitraToJson(AdminListMitra data) => json.encode(data.toJson());

class AdminListMitra {
    List<Success> success;

    AdminListMitra({
        required this.success,
    });

    factory AdminListMitra.fromJson(Map<String, dynamic> json) => AdminListMitra(
        success: List<Success>.from(json["Success"].map((x) => Success.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Success": List<dynamic>.from(success.map((x) => x.toJson())),
    };
}

class Success {
    int id;
    String nameRestoran;
    String notelpRestoran;
    String alamatRestoran;
    String bannerRestoran;
    String status;
    double ratingRestoranOverall;
    int usersId;
    DateTime createdAt;
    DateTime updatedAt;

    Success({
        required this.id,
        required this.nameRestoran,
        required this.notelpRestoran,
        required this.alamatRestoran,
        required this.bannerRestoran,
        required this.status,
        required this.ratingRestoranOverall,
        required this.usersId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Success.fromJson(Map<String, dynamic> json) => Success(
        id: json["id"],
        nameRestoran: json["name_restoran"],
        notelpRestoran: json["notelp_restoran"],
        alamatRestoran: json["alamat_restoran"],
        bannerRestoran: json["banner_restoran"],
        status: json["status"],
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
        "status": status,
        "rating_restoran_overall": ratingRestoranOverall,
        "users_id": usersId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
