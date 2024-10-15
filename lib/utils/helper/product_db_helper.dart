import 'package:sqflite/sqflite.dart';
import 'package:store_api/screen/cart/model/cart_model.dart';
import 'package:store_api/screen/home/model/home_model.dart';

class DBHelper {
  static DBHelper helper = DBHelper._();

  DBHelper._();

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
        String query =
            "CREATE TABLE product (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,image TEXT,category TEXT,description TEXT,price INTEGER,id INTEGER)";
        db.execute(query);
      },
    );
  }

  Future<void> insertDb(CartModel model) async {
    database = await checkDB();
    database!.insert('product', {
      'title': model.title,
      'image': model.image,
      'category': model.category,
      'description': model.description,
      'price': model.price,
      'id': model.id
    });
  }

  Future<List<CartModel>> redProduct() async {
    database = await checkDB();
    List<Map> l1 = await database!.rawQuery("SELECT * FROM product");
    List<CartModel> productList = l1
        .map(
          (e) => CartModel.mapToModel(e),
        )
        .toList();
    return productList;
  }

  Future<void> delete({int? id}) async {
    database = await checkDB();
    database!.delete("product", where: "id=?", whereArgs: [id]);

  }
}
