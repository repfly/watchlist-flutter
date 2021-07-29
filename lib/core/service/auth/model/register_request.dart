// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.username,
    required this.password,
    required this.email,
  });

  String username;
  String password;
  String email;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "email": email == null ? null : email,
  };
}
