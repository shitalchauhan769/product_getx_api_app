import 'package:sqflite/sqflite.dart';
class DBHelper
{
  Database? database;
  Future<Database> checkDB() async {
    database ??= await initDB();
    return database!;
  }

  Future<Database> initDB() async {

    String folder = await getDatabasesPath();
    String path = "$folder/demo.db";

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query = "CREATE TABLE product (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,amount TEXT,category TEXT,description TEXT)";
        db.execute(query);

      },
    );
  }

  void redProduct()
  {

  }
  Future<void> delete(int id ) async {
    database = await checkDB();
    String query = "DELETE FROM product WHERE id='$id'";
    database!.rawDelete(query);
  }
}