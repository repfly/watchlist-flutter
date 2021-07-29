// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    this.email,
    required this.username,
    required this.password,
     this.firstName,
     this.lastName,
  });

  String? email;
  String username;
  String password;
  String? firstName;
  String? lastName;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    email: json["email"] == null ? null : json["email"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
  };
}
