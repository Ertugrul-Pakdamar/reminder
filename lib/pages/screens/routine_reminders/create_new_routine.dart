import 'package:flutter/material.dart';
import 'package:reminder_app/pages/database/routines_database.dart';
import 'package:reminder_app/pages/models/routine.dart';

class CreateNewRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateNewRoutineState();
}

class CreateNewRoutineState extends State {
  RoutinesDatabase routinesDb = RoutinesDatabase();
  Routine newRoutine = Routine();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("New Routine"), backgroundColor: Colors.amber),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          newRoutine.title = titleController.text;
          newRoutine.description = descriptionController.text;
          var result = await routinesDb.insert(
              Routine.withoutId(titleController.text, descriptionController.text));
          Navigator.pop(context, true);
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.save, color: Color(0xff614151)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: titleController,
              decoration: InputDecoration(labelText: "Enter Title"),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Your Text"),
            ),
          ),
        ],
      ),
    );
  }
}