// To parse this JSON data, do
//
//     final dataMitraHome = dataMitraHomeFromJson(jsonString);

import 'dart:convert';

DataMitraHome dataMitraHomeFromJson(String str) => DataMitraHome.fromJson(json.decode(str));

String dataMitraHomeToJson(DataMitraHome data) => json.encode(data.toJson());

class DataMitraHome {
    List<Success> success;

    DataMitraHome({
        required this.success,
    });

    factory DataMitraHome.fromJson(Map<String, dynamic> json) => DataMitraHome(
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
    int usersId;
    DateTime createdAt;
    DateTime updatedAt;

    Success({
        required this.id,
        required this.nameRestoran,
        required this.notelpRestoran,
        required this.alamatRestoran,
        required this.bannerRestoran,
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
        "users_id": usersId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
