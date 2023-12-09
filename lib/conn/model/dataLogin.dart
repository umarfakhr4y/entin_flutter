
part of 'model.dart'; 
// To parse this JSON data, do
//
//     final dataLogin = dataLoginFromJson(jsonString);
// To parse this JSON data, do
//
//     final dataLogin = dataLoginFromJson(jsonString);

// import 'dart:convert';

DataLogin dataLoginFromJson(String str) => DataLogin.fromJson(json.decode(str));

String dataLoginToJson(DataLogin data) => json.encode(data.toJson());

class DataLogin {
    Success success;

    DataLogin({
        required this.success,
    });

    factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        success: Success.fromJson(json["Success"]),
    );

    Map<String, dynamic> toJson() => {
        "Success": success.toJson(),
    };
}

class Success {
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
    List<String> role;
    List<Data> datas;

    Success({
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
        required this.role,
        required this.datas,
    });

    factory Success.fromJson(Map<String, dynamic> json) => Success(
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
        role: List<String>.from(json["role"].map((x) => x)),
        datas: List<Data>.from(json["datas"].map((x) => Data.fromJson(x))),
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
        "role": List<dynamic>.from(role.map((x) => x)),
        "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
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
