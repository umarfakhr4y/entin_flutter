// To parse this JSON data, do
//
//     final restoSpecbyId = restoSpecbyIdFromJson(jsonString);

part of '../authModel.dart';
// To parse this JSON data, do
//
//     final restoSpecbyId = restoSpecbyIdFromJson(jsonString);
// To parse this JSON data, do
//
//     final restoSpecbyId = restoSpecbyIdFromJson(jsonString);

// import 'dart:convert';

RestoSpecbyId restoSpecbyIdFromJson(String str) => RestoSpecbyId.fromJson(json.decode(str));

String restoSpecbyIdToJson(RestoSpecbyId data) => json.encode(data.toJson());

class RestoSpecbyId {
    List<User> user;

    RestoSpecbyId({
        required this.user,
    });

    factory RestoSpecbyId.fromJson(Map<String, dynamic> json) => RestoSpecbyId(
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String name;
    String noTelp;
    String alamat;
    DateTime lahir;
    String image;
    String email;
    DateTime emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    List<Datum> data;

    User({
        required this.id,
        required this.name,
        required this.noTelp,
        required this.alamat,
        required this.lahir,
        required this.image,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        noTelp: json["no_telp"],
        alamat: json["alamat"],
        lahir: DateTime.parse(json["lahir"]),
        image: json["image"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "no_telp": noTelp,
        "alamat": alamat,
        "lahir": lahir.toIso8601String(),
        "image": image,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String nameRestoran;
    String notelpRestoran;
    String alamatRestoran;
    String bannerRestoran;
    dynamic ratingRestoranOverall;
    int usersId;
    DateTime createdAt;
    DateTime updatedAt;
    List<Makanan> makanan;
    List<Makanan> minuman;
    List<RatingResto> ratingResto;

    Datum({
        required this.id,
        required this.nameRestoran,
        required this.notelpRestoran,
        required this.alamatRestoran,
        required this.bannerRestoran,
        this.ratingRestoranOverall,
        required this.usersId,
        required this.createdAt,
        required this.updatedAt,
        required this.makanan,
        required this.minuman,
        required this.ratingResto,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nameRestoran: json["name_restoran"],
        notelpRestoran: json["notelp_restoran"],
        alamatRestoran: json["alamat_restoran"],
        bannerRestoran: json["banner_restoran"],
        ratingRestoranOverall: json["rating_restoran_overall"],
        usersId: json["users_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        makanan: List<Makanan>.from(json["makanan"].map((x) => Makanan.fromJson(x))),
        minuman: List<Makanan>.from(json["minuman"].map((x) => Makanan.fromJson(x))),
        ratingResto: List<RatingResto>.from(json["rating_resto"].map((x) => RatingResto.fromJson(x))),
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
        "makanan": List<dynamic>.from(makanan.map((x) => x.toJson())),
        "minuman": List<dynamic>.from(minuman.map((x) => x.toJson())),
        "rating_resto": List<dynamic>.from(ratingResto.map((x) => x.toJson())),
    };
}

class Makanan {
    int id;
    String nameBarang;
    int stockBarang;
    String jenisBarang;
    int hargaBarang;
    int dataId;
    DateTime createdAt;
    DateTime updatedAt;

    Makanan({
        required this.id,
        required this.nameBarang,
        required this.stockBarang,
        required this.jenisBarang,
        required this.hargaBarang,
        required this.dataId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Makanan.fromJson(Map<String, dynamic> json) => Makanan(
        id: json["id"],
        nameBarang: json["name_barang"],
        stockBarang: json["stock_barang"],
        jenisBarang: json["jenis_barang"]!,
        hargaBarang: json["harga_barang"],
        dataId: json["data_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_barang": nameBarang,
        "stock_barang": stockBarang,
        "jenis_barang": jenisBarangValues.reverse[jenisBarang],
        "harga_barang": hargaBarang,
        "data_id": dataId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum JenisBarang { MAKANAN_CUY_BARU, MAKANAN, MINUMAN }

final jenisBarangValues = EnumValues({
    "Makanan": JenisBarang.MAKANAN,
    "makanan cuy baru": JenisBarang.MAKANAN_CUY_BARU,
    "Minuman": JenisBarang.MINUMAN
});

class RatingResto {
    int id;
    String ulasan;
    double ratingRestoran;
    int usersId;
    int dataId;
    DateTime? createdAt;
    DateTime? updatedAt;

    RatingResto({
        required this.id,
        required this.ulasan,
        required this.ratingRestoran,
        required this.usersId,
        required this.dataId,
        this.createdAt,
        this.updatedAt,
    });

    factory RatingResto.fromJson(Map<String, dynamic> json) => RatingResto(
        id: json["id"],
        ulasan: json["ulasan"],
        ratingRestoran: json["rating_restoran"]?.toDouble(),
        usersId: json["users_id"],
        dataId: json["data_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ulasan": ulasan,
        "rating_restoran": ratingRestoran,
        "users_id": usersId,
        "data_id": dataId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
