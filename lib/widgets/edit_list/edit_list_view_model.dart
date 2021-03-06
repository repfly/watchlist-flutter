import 'package:flutter/cupertino.dart';
import 'package:watchlist/core/service/list/list_service.dart';
import 'package:watchlist/core/service/list/model/request/update_list_title_request.dart';
import 'package:watchlist/widgets/alert/toast_alert.dart';
import 'package:watchlist/widgets/edit_list/edit_list.dart';

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
      ErrorAlert().showError(context, false, message: "Successfully updated");
      return;
    }
    ErrorAlert()
        .showError(context, true, message: "Please fill necessary fields");
  }

  deleteList(String listId) async {
    await ListService.shared.deleteList(listId);
    Navigator.of(context).pop();
    ErrorAlert().showError(context, false, message: "Successfully deleted");
  }
}
