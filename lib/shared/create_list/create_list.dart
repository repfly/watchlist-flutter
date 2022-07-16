import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/list_service.dart';
import 'package:watchlist/modules/profile/profile.dart';

import '../alert/toast_alert.dart';

class CreateList extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Create a list"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                autofocus: false,
                autocorrect: false,
                controller: titleController,
                decoration: fieldDecoration("List title"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: saveListButton(context),
    );
  }

  saveListButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () async {
          await listCreate(context);
        });
  }

  fieldDecoration(String hintText) {
    return InputDecoration(
      labelText: hintText,
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }

  listCreate(BuildContext context) async {
    if (titleController.text.isEmpty) {
      CustomAlert.showToast("Please fill necessary fields", isAlert: true);
      return;
    }
    await ListService.shared.createList(titleController.text);
    CustomAlert.showToast("Successfully created");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
  }
}
