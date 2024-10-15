import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_api/screen/home/model/home_model.dart';

class ApiHelper{
  Future<List<ProductModel>?> productApI () async {
    String? link = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      List<ProductModel> productList = json.map((e) => ProductModel.mapToModel(e)).toList();
      return productList;
    }
    return null;
  }
}