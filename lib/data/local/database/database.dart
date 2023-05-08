


import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:utc_student_app/data/local/database/constant.dart';

class DatabaseProvider {
  static final DatabaseProvider db = DatabaseProvider();
  static const dbName = 'utc.db';
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    if (_database != null) {
      return true;
    }
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}/$dbName';
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: initDB,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute(createStudent);
    await database.execute(createStudentTerm);
    await database.execute(createExam);
    await database.execute(createGpa);
    await database.execute(createSchedule);
    await database.execute(createMark);
    await database.execute(createNews);
    await database.execute(createPoint);
    await database.execute(createTuition);
  }
}