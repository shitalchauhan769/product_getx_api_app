import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:store_api/screen/cart/model/cart_model.dart';
import 'package:store_api/screen/home/cantroller/home_controller.dart';
import 'package:store_api/screen/home/model/home_model.dart';

import '../../../utils/helper/product_db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {

    super.initState();
    controller.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShopNow"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/cart");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: controller.productData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Text("${snapshot.error}");
            }
            else if (snapshot.hasData) {
              List<ProductModel>? model = snapshot.data ;
              print(model);
              if (model == null) {
              return  const Text("Not Data");
              }
              else {
              return  GridView.builder(
                  itemCount:model.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 250,crossAxisSpacing: 5,mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed("/product",arguments: model[index]);
                      },
                      child: Container(
                        // height: MediaQuery.sizeOf(context).height * 0.50,
                        // width:MediaQuery.sizeOf(context).width * 0.30,
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        imageUrl: "${model[index].image}",width: 100,height: 100,
                                        errorWidget: (context, url, error) =>
                                            const FlutterLogo(
                                          size: 120,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(
                                      "${model[index].title}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,
                                    ),
                                     Text(
                                      "\$ ${model[index].price}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      "${model[index].category}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              CartModel p1 = CartModel(
                                                  id: model[index].id,
                                                  image: model[index].image,
                                                  category: model[index].category,
                                                  description: model[index].description,
                                                  price: model[index].price,
                                                  title: model[index].title);
                                              DBHelper.helper.insertDb(p1);
                                              controller.getAPIData();
                                      
                                      
                                            },
                                            icon: const Icon(
                                              Icons.favorite,
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),


                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }
            return Center(child: const CircularProgressIndicator());
          },

        ),
      ),
    );
  }
}
