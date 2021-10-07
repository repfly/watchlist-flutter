import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/core/service/list/list_service.dart';
import 'package:watchlist/modules/profile/profile.dart';
import 'package:watchlist/widgets/alert/toast_alert.dart';

class CreateList extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();

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
              titleField,
              Spacer(),
              Positioned(
                  child: ElevatedButton(
                onPressed: () async {
                  await listCreate(context);
                },
                child: Text('Create list'),
              ))
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

  listCreate(BuildContext context) async {
    if (titleController.text.isEmpty) {
      ErrorAlert()
          .showError(context, true, message: "Please fill necessary fields");
      return;
    }
    await ListService.shared.createList(titleController.text);
    ErrorAlert().showError(context, false, message: "Successfully created");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
  }
}
