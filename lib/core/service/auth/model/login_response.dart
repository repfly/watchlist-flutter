// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.type,
    required this.token,
  });

  LoginResponseType type;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    type: EnumToString.fromString(LoginResponseType.values, json["type"])!,
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "type": EnumToString.convertToString(type),
    "token": token == null ? null : token,
  };
}

enum LoginResponseType {
  SUCCESS,
  WRONG_CREDENTIALS
}