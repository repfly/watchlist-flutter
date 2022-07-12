import 'package:flutter/cupertino.dart';
import 'package:watchlist/core/service/list/list_service.dart';
import 'package:watchlist/core/service/list/model/request/update_list_title_request.dart';

import '../alert/toast_alert.dart';
import 'edit_list.dart';

abstract class EditListViewModel extends State<EditList> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  updateListTitle(String listId) async {
    if (titleController.text.isNotEmpty) {
      await ListService.shared.updateListTitleById(new UpdateListTitleRequest(
          newTitle: titleController.text, listId: listId));
      CustomAlert.showToast("Successfully updated");
      return;
    }
    CustomAlert.showToast("Please fill necessary fields", isAlert: true);
  }

  deleteList(String listId) async {
    await ListService.shared.deleteList(listId);
    Navigator.of(context).pop();
    CustomAlert.showToast("Successfully deleted");
  }
}
