import 'package:flutter/material.dart';
import 'package:ocrdeneme/core/models/bill_model/bill_model.dart';
import 'package:sqflite/sqflite.dart';

import 'IDatabase_service.dart';

class DatabaseService implements IDatabaseService {
  static DatabaseService _instance = DatabaseService._init();
  static DatabaseService get instance => _instance;

  DatabaseService._init();

  Future<void> get database async {
    if (_db != null) return;
    await initDb();
  }

  Database? _db;
  final int _version = 1;
  final String _tableName = 'bills';
  String _path = "";
  Future<void> initDb() async {
    try {
      _path = await getDatabasesPath() + 'bills.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, category STRING, amount REAL, tax INTEGER, moneyType STRING, corporation STRING, report STRING, date STRING, billNo INTEGER,)",
          );
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<List<BillModel>> getTasks() async {
    List<Map<String, dynamic>> tasks = await _db!.query('tasks');
    return tasks.map((data) => BillModel.fromJson(data)).toList();
  }

  Future<int> insert(BillModel bill) async {
    return await _db!.insert(_tableName, bill.toJson());
  }

  Future<void> deleteDb() async {
    await _db!.delete(_tableName);
    deleteDatabase(_path);
    _db = null;
  }

  // static Future<int> delete(Task task) async =>
  //     await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);

  Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  Future<int> update(int id) async {
    return await _db!.rawUpdate(
        ''' UPDATE tasks SET isCompleted = ? WHERE id = ? ''', [1, id]);
  }
}
