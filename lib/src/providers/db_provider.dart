import 'dart:io';

import 'package:path/path.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
//Constructor privado
  DBProvider._();
  //Obtener valor
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        //CRear primer tabla
        await db.execute('CREATE TABLE Scans('
            ' id INTEGER PRIMARY KEY,  '
            ' tipo TEXT, '
            ' valor TEXT '
            ')');
      },
    );
  }

  /// CREAR REGISTROS DE DB
//MODO A
  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.rawInsert(
        //El espacio es importante
         "INSERT Into Scans (id, tipo, valor) "
        "VALUES ( ${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}' )");
    return res;
  }

//MODO B
  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;

    final res = db.insert('Scans', nuevoScan.toJson());
    return res;
  }
}
