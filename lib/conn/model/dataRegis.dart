// To parse this JSON data, do
//
//     final dataRegis = dataRegisFromJson(jsonString);

import 'dart:convert';

DataRegis dataRegisFromJson(String str) => DataRegis.fromJson(json.decode(str));

String dataRegisToJson(DataRegis data) => json.encode(data.toJson());

class DataRegis {
    Success success;

    DataRegis({
        required this.success,
    });

    factory DataRegis.fromJson(Map<String, dynamic> json) => DataRegis(
        success: Success.fromJson(json["success"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success.toJson(),
    };
}

class Success {
    String token;
    String name;
    String image;
    List<String> role;

    Success({
        required this.token,
        required this.name,
        required this.image,
        required this.role,
    });

    factory Success.fromJson(Map<String, dynamic> json) => Success(
        token: json["token"],
        name: json["name"],
        image: json["image"],
        role: List<String>.from(json["role"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "image": image,
        "role": List<dynamic>.from(role.map((x) => x)),
    };
}
