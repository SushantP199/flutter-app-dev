import 'package:mytodo_db/note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/utils/utils.dart';

class DatabaseHelper {
  // Singleton instance
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String notesDb = 'notes.db';
  String notesTable = 'notestable';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'description';
  String colDate = 'date';
  String colPriority = 'priority';

  // Defining named constructors to create its instance call whenever required as below
  DatabaseHelper._createInstance();

  // Whenever we create object of DatabaseHelper() it will returns the singleton object i.e. same instance as below
  factory DatabaseHelper() {
    if (DatabaseHelper._databaseHelper == null) {
      DatabaseHelper._databaseHelper = DatabaseHelper._createInstance();
    }
    return DatabaseHelper._databaseHelper;
  }

  Future<Database> get database async {
    if (DatabaseHelper._database == null) {
      DatabaseHelper._database = await initializeDatabase();
    }
    return DatabaseHelper._database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/' + this.notesDb;

    var notesDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return notesDatabase;
  }
  // Getting started with CRUD operations

  // C - Create
  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $notesTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDesc TEXT, $colDate TEXT, $colPriority INTEGER)',
    );
  }

  // R - Read
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    // List of maps of note
    var db = await this.database;
    // var result = await db.rawQuery('SELECT * FROM $notesTable order by $colPriority ASC');
    var result = await db.query(this.notesTable, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    // int result = await db.rawInsert(
    //     'INSERT INTO $notesTable VALUES (?, ?, ?, ?, ?)',
    //     [note.id, note.title, note.description, note.date, note.priority]);
    int result = await db.insert(this.notesTable, note.toMap());
    return result;
  }

  // U - Update
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    // int result = await db.rawUpdate(
    //   'UPDATE $notesTable SET $colId = ?, $colTitle = ?, $colDesc = ?, $colDate = ?, $colPriority = ? WHERE id = ?',
    //   [
    //     note.id,
    //     note.title,
    //     note.description,
    //     note.date,
    //     note.priority,
    //     note.id
    //   ],
    // );
    int result = await db.update(this.notesTable, note.toMap(),
        where: '${this.colId} = ?', whereArgs: [note.id]);
    return result;
  }

  // D - Delete
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    // int result =
    //     await db.rawDelete('DELETE FROM $notesTable WHERE $colId = $id');
    int result =
        await db.delete(this.notesTable, where: '$colId = ?', whereArgs: [id]);
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT COUNT(*) FROM $notesTable');
    var count = firstIntValue(result);
    return count;
  }

  // List of notes only
  Future<List<Note>> getNotesList() async {
    var getMapsList = await this.getNoteMapList();
    int count = getMapsList.length;
    List<Note> notesList = List<Note>();

    for (int i = 0; i < count; i++) {
      notesList.add(Note.fromMapObject(getMapsList[i]));
    }

    return notesList;
  }
}
