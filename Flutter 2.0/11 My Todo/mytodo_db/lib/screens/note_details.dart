import 'package:flutter/material.dart';
import 'package:mytodo_db/note.dart';
import 'package:mytodo_db/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.appBarTitle, this.note);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.appBarTitle, this.note);
  }
}

class NoteDetailState extends State<NoteDetail> {
  final String appBarTitle;
  final Note note;

  NoteDetailState(this.appBarTitle, this.note);

  DatabaseHelper helper = DatabaseHelper();
  static var _priority = ['Low', 'High'];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    titleController.text = note.title;
    descriptionController.text = note.description;
    return WillPopScope(
      onWillPop: () {
        navigateToLastScreen();
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => navigateToLastScreen(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: ListTile(
                    leading: Icon(Icons.low_priority),
                    title: DropdownButton(
                      items: _priority.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        );
                      }).toList(),
                      value: getStringPriorityfromInt(note.priority),
                      onChanged: (valueSelectedByUser) {
                        setState(() {
                          updatePriorityStringToInt(valueSelectedByUser);
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      updateTitle();
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      icon: Icon(Icons.title),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      updateDescription();
                    },
                    decoration: InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Description',
                      icon: Icon(Icons.details),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.green,
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Save',
                            // textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button event");
                              _save();
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.red,
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Delete',
                            // textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("delete button event");
                              _delete();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {
    navigateToLastScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      result = await helper.updateNote(note);
    } else {
      result = await helper.insertNote(note);
    }
    if (result != 0) {
      showMessage('Status', 'Note saved successfully');
    } else {
      showMessage(note.title, 'Problem occur while saving note.');
    }
  }

  void _delete() async {
    navigateToLastScreen();

    if (note.id == null) {
      showMessage('Status', 'First add the note');
      return;
    }
    int result;
    result = await helper.deleteNote(note.id);
    if (result != 0) {
      showMessage('Status', 'Note deleted successfully');
    } else {
      showMessage(note.title, 'Error.');
    }
  }

  // Convert priority string to int
  void updatePriorityStringToInt(String priority) {
    switch (priority) {
      case 'Low':
        note.priority = 2;
        break;
      case 'High':
        note.priority = 1;
        break;
    }
  }

  // Convert priority int to string
  String getStringPriorityfromInt(int value) {
    String priority;
    switch (value) {
      case 2:
        priority = _priority[0];
        break;
      case 1:
        priority = _priority[1];
        break;
    }
    return priority;
  }

  void navigateToLastScreen() {
    Navigator.pop(context);
  }

  void showMessage(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }
}

/*class NoteDetail extends StatefulWidget {
  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
