import 'package:flutter/material.dart';
import 'package:my_todo/database_helper.dart';
import 'package:my_todo/note.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'note_details.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note>? noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = <Note>[];
      updateNoteListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('LCO To Do'),
        backgroundColor: Colors.purple,
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetails('Add note', Note('', '', 2));
        },
        child: const Icon(Icons.add_box),
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
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://learncodeonline.in/mascot.png',
              ),
            ),
            title: Text(
              noteList?[position].title ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              noteList?[position].date ?? "",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: GestureDetector(
              child: const Icon(
                Icons.open_in_new,
                color: Colors.white,
              ),
              onTap: () {
                navigateToDetails(
                  'Edit To Do',
                  noteList?[position] ?? Note('', '', 0),
                );
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
          count = noteList.length;
        });
      });
    });
  }
}
