import 'package:flutter/material.dart';
import 'package:mytodo_db/note.dart';
import 'package:mytodo_db/database_helper.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'note_details.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateNoteListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('LCO To Do'),
        backgroundColor: Colors.purple,
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.navigateToDetails('Add note', Note('', '', 2));
        },
        child: Icon(Icons.add_box),
      ),
    );
  }

  void navigateToDetails(String title, Note note) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title, note);
    }));
    updateNoteListView();
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, position) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.deepPurpleAccent,
          elevation: 5.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://learncodeonline.in/mascot.png'),
            ),
            title: Text(
              this.noteList[position].title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              this.noteList[position].date,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.open_in_new,
                color: Colors.white,
              ),
              onTap: () {
                navigateToDetails('Edit To Do', this.noteList[position]);
              },
            ),
          ),
        );
      },
    );
  }

  updateNoteListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNotesList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
