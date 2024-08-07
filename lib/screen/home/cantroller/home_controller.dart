import 'package:get/get.dart';
import 'package:store_api/utils/api_helper.dart';
import '../model/home_model.dart';

class HomeController extends GetxController
{
  Future<List<ProductModel>?>? productData;
  ApiHelper helper=ApiHelper();
  RxList<ProductModel>cartList=<ProductModel>[].obs;



   void getProductData()  {
    productData =  helper.productApI();
  }
}