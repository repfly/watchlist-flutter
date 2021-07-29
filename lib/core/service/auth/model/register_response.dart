// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.type,
    this.user,
  });

  String type;
  User? user;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    type: json["type"] == null ? null : json["type"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "user": user == null ? null : user!.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String username;
  String password;
  String email;
  dynamic firstName;
  dynamic lastName;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    email: json["email"] == null ? null : json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "email": email == null ? null : email,
    "firstName": firstName,
    "lastName": lastName,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

enum RegisterResponseType {
  SUCCESS,
  EMAIL_OR_USERNAME_ALREADY_EXISTS
}