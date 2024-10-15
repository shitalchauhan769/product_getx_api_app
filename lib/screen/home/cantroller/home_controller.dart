import 'package:get/get.dart';
import 'package:store_api/screen/cart/model/cart_model.dart';
import 'package:store_api/utils/helper/api_helper.dart';
import 'package:store_api/utils/helper/product_db_helper.dart';
import '../model/home_model.dart';

class HomeController extends GetxController
{
  Future<List<ProductModel>?>? productData;
  ApiHelper helper=ApiHelper();
  RxList<CartModel>cartList=<CartModel>[].obs;
   void getProductData()  {
    productData =  helper.productApI();
  }
  Future<void> getAPIData() async {
    cartList.value=await DBHelper.helper.redProduct();
  }

}