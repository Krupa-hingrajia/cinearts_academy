// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotificationDBHelper {
  Database? database;

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "notification.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE notification (id INTEGER PRIMARY KEY AUTOINCREMENT ,notification TEXT,time TEXT)";
      db.execute(query);
    });
  }

  Future<int> insertNotification(
      {String? notification,
      String? time,}) async {
    database = await checkDB();
    return await database!.insert('notification', {
      'notification': notification,
      'time': time,
    });
  }

  Future<List<Map<String, dynamic>>> readNotificationsData() async {
    database = await checkDB();
    String query = "";

      query = "SELECT * FROM notification";

    var res = database!.rawQuery(query);
    return res;
  }
}
