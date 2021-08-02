import 'dart:convert';

UpdateListTitleRequest updateListTitleRequestFromJson(String str) => UpdateListTitleRequest.fromJson(json.decode(str));

String updateListTitleRequestToJson(UpdateListTitleRequest data) => json.encode(data.toJson());

class UpdateListTitleRequest {
  UpdateListTitleRequest({
    required this.newTitle,
    required this.listId,
  });

  String newTitle;
  String listId;

  factory UpdateListTitleRequest.fromJson(Map<String, dynamic> json) => UpdateListTitleRequest(
    newTitle: json["newTitle"] == null ? null : json["newTitle"],
    listId: json["listId"] == null ? null : json["listId"],
  );

  Map<String, dynamic> toJson() => {
    "newTitle": newTitle == null ? null : newTitle,
    "listId": listId == null ? null : listId,
  };
}
