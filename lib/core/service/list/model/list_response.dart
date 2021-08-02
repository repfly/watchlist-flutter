import 'dart:convert';

ListResponse listResponseFromJson(String str) => ListResponse.fromJson(json.decode(str));

String listResponseToJson(ListResponse data) => json.encode(data.toJson());

class ListResponse {
  ListResponse({
    required this.listId,
    required this.owner,
    required this.listTitle,
    required this.movies,
  });

  String listId;
  String owner;
  String listTitle;
  List<String>? movies;

  factory ListResponse.fromJson(Map<String, dynamic> json) => ListResponse(
    listId: json["listId"] == null ? null : json["listId"],
    owner: json["owner"] == null ? null : json["owner"],
    listTitle: json["listTitle"] == null ? null : json["listTitle"],
    movies: json["movies"] == null ? null : List<String>.from(json["movies"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "listId": listId == null ? null : listId,
    "owner": owner == null ? null : owner,
    "listTitle": listTitle == null ? null : listTitle,
    "movies": movies == null ? null : List<dynamic>.from(movies!.map((x) => x)),
  };
}
