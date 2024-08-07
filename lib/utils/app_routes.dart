
import 'package:flutter/cupertino.dart';
import 'package:store_api/screen/cart/view/cart_screen.dart';
import 'package:store_api/screen/product/view/product_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>app_routes={
  "/":(c1)=>const HomeScreen(),
  "/product":(c1)=>const ProductScreen(),
  "/cart":(c1)=>const CartScreen(),
};