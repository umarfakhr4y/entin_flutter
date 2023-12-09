// To parse this JSON data, do
//
//     final adminDropspotModel = adminDropspotModelFromJson(jsonString);

import 'dart:convert';

AdminDropspotModel adminDropspotModelFromJson(String str) => AdminDropspotModel.fromJson(json.decode(str));

String adminDropspotModelToJson(AdminDropspotModel data) => json.encode(data.toJson());

class AdminDropspotModel {
    List<Success> success;

    AdminDropspotModel({
        required this.success,
    });

    factory AdminDropspotModel.fromJson(Map<String, dynamic> json) => AdminDropspotModel(
        success: List<Success>.from(json["Success"].map((x) => Success.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Success": List<dynamic>.from(success.map((x) => x.toJson())),
    };
}

class Success {
    int id;
    int idLokasi;
    String namaDropspot;
    String noTelpPj;
    DateTime createdAt;
    DateTime updatedAt;

    Success({
        required this.id,
        required this.idLokasi,
        required this.namaDropspot,
        required this.noTelpPj,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Success.fromJson(Map<String, dynamic> json) => Success(
        id: json["id"],
        idLokasi: json["id_lokasi"],
        namaDropspot: json["nama_dropspot"],
        noTelpPj: json["no_telp_pj"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_lokasi": idLokasi,
        "nama_dropspot": namaDropspot,
        "no_telp_pj": noTelpPj,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
