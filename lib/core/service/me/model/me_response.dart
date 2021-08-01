// To parse this JSON data, do
//
//     final meRespones = meResponesFromJson(jsonString);

import 'dart:convert';

MeResponse meResponseFromJson(String str) => MeResponse.fromJson(json.decode(str));

String meResponseToJson(MeResponse data) => json.encode(data.toJson());

class MeResponse {
  MeResponse({
    required this.email,
    required this.username,
    this.firstName,
    this.lastName,
    required this.userLists,
  });

  String email;
  String username;
  String? firstName;
  String? lastName;
  List<String> userLists;

  factory MeResponse.fromJson(Map<String, dynamic> json) => MeResponse(
    email: json["email"] == null ? null : json["email"],
    username: json["username"] == null ? null : json["username"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    userLists: List<String>.from(json["userLists"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "email": email == null ? null : email,
    "username": username == null ? null : username,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "userLists": userLists == null ? null : List<dynamic>.from(userLists.map((x) => x)),
  };
}
