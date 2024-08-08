import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:store_api/screen/home/cantroller/home_controller.dart';

import '../../home/model/home_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
ProductModel product=Get.arguments;
HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("ShopNow"),
      ),
      body: Column(
        children: [
          Container(
            height: 600,width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(color:Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      imageUrl: "${product.image}",height: 300,width: 300,
                      errorWidget: (context, url, error) => const FlutterLogo(size: 200,),
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Text(
                    "${product.title}",
                    style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${product.price}",
                    style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.orange),
                  ),
                  Text(
                    "${product.category}",
                    style:
                    TextStyle(fontSize: 15, ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "Discretion",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold, ),
                  ),
                  const Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
                    style:
                    TextStyle(fontSize: 15, ),textAlign: TextAlign.justify ,
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {

               controller.cartList.add(product);
               Get.back();
              },
              child: Align(alignment: Alignment.bottomCenter,
                child: Card(
                  child: Container(alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                       color: Colors.orange.shade400,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Text("Add To Cart",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
