// To parse this JSON data, do
//
//     final dataOrderPengguna = dataOrderPenggunaFromJson(jsonString);

import 'dart:convert';

DataOrderPengguna dataOrderPenggunaFromJson(String str) => DataOrderPengguna.fromJson(json.decode(str));

String dataOrderPenggunaToJson(DataOrderPengguna data) => json.encode(data.toJson());

class DataOrderPengguna {
    List<User> user;

    DataOrderPengguna({
        required this.user,
    });

    factory DataOrderPengguna.fromJson(Map<String, dynamic> json) => DataOrderPengguna(
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String noOrder;
    String status;
    int quantity;
    int usersId;
    int dataId;
    int makananId;
    dynamic createdAt;
    dynamic updatedAt;
    Makanan makanan;
    Data data;

    User({
        required this.id,
        required this.noOrder,
        required this.status,
        required this.quantity,
        required this.usersId,
        required this.dataId,
        required this.makananId,
        this.createdAt,
        this.updatedAt,
        required this.makanan,
        required this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        noOrder: json["no_order"],
        status: json["status"],
        quantity: json["quantity"],
        usersId: json["users_id"],
        dataId: json["data_id"],
        makananId: json["makanan_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        makanan: Makanan.fromJson(json["makanan"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no_order": noOrder,
        "status": status,
        "quantity": quantity,
        "users_id": usersId,
        "data_id": dataId,
        "makanan_id": makananId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "makanan": makanan.toJson(),
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String nameRestoran;
    String notelpRestoran;
    String alamatRestoran;
    String bannerRestoran;
    dynamic ratingRestoranOverall;
    int usersId;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.nameRestoran,
        required this.notelpRestoran,
        required this.alamatRestoran,
        required this.bannerRestoran,
        this.ratingRestoranOverall,
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
        ratingRestoranOverall: json["rating_restoran_overall"],
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
        jenisBarang: json["jenis_barang"],
        hargaBarang: json["harga_barang"],
        dataId: json["data_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_barang": nameBarang,
        "stock_barang": stockBarang,
        "jenis_barang": jenisBarang,
        "harga_barang": hargaBarang,
        "data_id": dataId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
