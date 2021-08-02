import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/model/list_response.dart';
import 'package:watchlist/widgets/edit_list/edit_list_view_model.dart';

class EditListView extends EditListViewModel {
  late final ListResponse list;

  EditListView(this.list);

  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
      autofocus: false,
      autocorrect: false,
      controller: titleController,
      decoration: fieldDecoration("New title"),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Edit your list"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              titleField,
              ElevatedButton(
                  onPressed: () async {
                    await updateListTitle(list.listId);
                  },
                  child: Text("Save")),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  deleteList(list.listId);
                },
                child: Text('Delete this list'),
              )
            ],
          ),
        ),
      ),
    );
  }

  fieldDecoration(String hintText) {
    return InputDecoration(
      labelText: hintText,
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }
}
