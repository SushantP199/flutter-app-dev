import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_todo/database_helper.dart';
import 'package:my_todo/note.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  const NoteDetail(this.appBarTitle, this.note, {super.key});

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(appBarTitle, note);
  }
}

class NoteDetailState extends State<NoteDetail> {
  final String appBarTitle;
  final Note note;

  NoteDetailState(this.appBarTitle, this.note);

  DatabaseHelper helper = DatabaseHelper();
  static final _priority = ['Low', 'High'];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge;

    titleController.text = note.title;
    descriptionController.text = note.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => navigateToLastScreen(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: ListTile(
                  leading: const Icon(Icons.low_priority),
                  title: DropdownButton(
                    items: _priority.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: const TextStyle(
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
                        updatePriorityStringToInt(valueSelectedByUser ?? "0");
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 15.0),
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
                    icon: const Icon(Icons.title),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 15.0),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (value) {
                    updateDescription();
                  },
                  decoration: InputDecoration(
                    labelStyle: textStyle,
                    labelText: 'Description',
                    icon: const Icon(Icons.details),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.green,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            Colors.white,
                          ),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.all(8.0),
                          ),
                        ),
                        child: const Text(
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
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.red,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            Colors.white,
                          ),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.all(8.0),
                          ),
                        ),
                        child: const Text(
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
    );
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {
    print("object");
    print("object");
    print("object");
    print("object");
    print("object");
    print("object");
    print("object");
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
    result = await helper.deleteNote(note.id ?? 0);
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
    late String priority;
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
