import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../home/cantroller/home_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
// HeroController controller =Get.find();
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.white,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          imageUrl: "${controller.cartList[index].image}",
                          errorWidget: (context, url, error) => const FlutterLogo(size: 60),
                          alignment: Alignment.center,
                        ),
                        const Text("ProductName",style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
