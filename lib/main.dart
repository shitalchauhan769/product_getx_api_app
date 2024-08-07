import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:store_api/utils/app_routes.dart';

void main() {


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),

  );
}
