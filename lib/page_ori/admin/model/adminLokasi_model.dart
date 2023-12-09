// To parse this JSON data, do
//
//     final adminLokasi = adminLokasiFromJson(jsonString);

import 'dart:convert';

AdminLokasi adminLokasiFromJson(String str) => AdminLokasi.fromJson(json.decode(str));

String adminLokasiToJson(AdminLokasi data) => json.encode(data.toJson());

class AdminLokasi {
    List<Success> success;

    AdminLokasi({
        required this.success,
    });

    factory AdminLokasi.fromJson(Map<String, dynamic> json) => AdminLokasi(
        success: List<Success>.from(json["Success"].map((x) => Success.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Success": List<dynamic>.from(success.map((x) => x.toJson())),
    };
}

class Success {
    int id;
    String namaLokasi;
    String noTelp;
    String alamat;
    DateTime createdAt;
    DateTime updatedAt;

    Success({
        required this.id,
        required this.namaLokasi,
        required this.noTelp,
        required this.alamat,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Success.fromJson(Map<String, dynamic> json) => Success(
        id: json["id"],
        namaLokasi: json["nama_lokasi"],
        noTelp: json["no_telp"],
        alamat: json["alamat"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lokasi": namaLokasi,
        "no_telp": noTelp,
        "alamat": alamat,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
