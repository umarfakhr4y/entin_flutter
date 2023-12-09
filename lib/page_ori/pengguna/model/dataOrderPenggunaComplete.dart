// To parse this JSON data, do
//
//     final dataOrderPenggunaComplete = dataOrderPenggunaCompleteFromJson(jsonString);

import 'dart:convert';

DataOrderPenggunaComplete dataOrderPenggunaCompleteFromJson(String str) =>
    DataOrderPenggunaComplete.fromJson(json.decode(str));

String dataOrderPenggunaCompleteToJson(DataOrderPenggunaComplete data) =>
    json.encode(data.toJson());

class DataOrderPenggunaComplete {
  List<User> user;

  DataOrderPenggunaComplete({
    required this.user,
  });

  factory DataOrderPenggunaComplete.fromJson(Map<String, dynamic> json) =>
      DataOrderPenggunaComplete(
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
  DateTime createdAt;
  DateTime updatedAt;
  Makanan makanan;

  User({
    required this.id,
    required this.noOrder,
    required this.status,
    required this.quantity,
    required this.usersId,
    required this.dataId,
    required this.makananId,
    required this.createdAt,
    required this.updatedAt,
    required this.makanan,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        noOrder: json["no_order"],
        status: json["status"],
        quantity: json["quantity"],
        usersId: json["users_id"],
        dataId: json["data_id"],
        makananId: json["makanan_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        makanan: Makanan.fromJson(json["makanan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_order": noOrder,
        "status": status,
        "quantity": quantity,
        "users_id": usersId,
        "data_id": dataId,
        "makanan_id": makananId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "makanan": makanan.toJson(),
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
