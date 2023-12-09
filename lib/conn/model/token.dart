// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

part of 'model.dart';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
    Token({
        required this.status,
        required this.token,
        required this.role,
    });

    int status;
    String token;
    List<String> role;

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        status: json["status"],
        token: json["token"],
        role: List<String>.from(json["role"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "role": List<dynamic>.from(role.map((x) => x)),
    };
}
