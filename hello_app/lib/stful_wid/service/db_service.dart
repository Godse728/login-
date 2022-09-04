import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  static int _version = 1;
  static late Database db;
  static Future<void> initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, "our_db.db");
    print(dbPath);
    final Database _db = await openDatabase(dbPath, version: _version,
        onConfigure: (db) {
      try {
        db.execute('''
CREATE TABLE IF NOT EXISTS notes(
id INTEGER PRIMARY KEY AUTOINCREMENT ,
title VARCHAR,
body TEXT,
datecreated VARCHAR,
dateUpadated VARCHAR);
''');
      } catch (e) {
        print(e);
      }
    },
        onOpen: (db) {},
        onCreate: (db, version) {},
        onUpgrade: (db, oldVersion, newVersion) {},
        onDowngrade: (db, oldVersion, newVersion) {});
    db = _db;
    return;
  }

  static addNotes({
    required String body,
    required String title,
  }) async {
    try {
      await db.insert(
        "notes",
        {
          "title": title,
          "body": body,
          "dateCreated": DateTime.now().toUtc().toString()
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<List> getNotes() async {
    final result = await db.query("notes");
    print(result);
    return result;
  }

  static deleteNotes(int id) async {
    try {
      return await db.delete(
        "notes",
        where: "id=?",
        whereArgs: [id],
      );
    } catch (e) {
      print(e);
    }
    getNotes();
  }

  static updateCode(
      {required int noteId,
      required String title,
      required String body}) async {
    try {
      await db.update("notes",
       {"title": title, "body": body},
          where: "=id?", whereArgs: [noteId]);
    } catch (e) {
      print(e);
    }
  }
}
