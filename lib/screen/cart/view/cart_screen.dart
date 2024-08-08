import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
        itemCount: controller.cartList.length,
        itemBuilder: (context, index) {
          return Obx( ()=> Column(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.sizeOf(context).width*150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.white,
                  ),
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          imageUrl: "${controller.cartList[index].image}",
                          height: 50,
                          width: 50,
                          errorWidget: (context, url, error) =>
                              const FlutterLogo(size: 60),
                          alignment: Alignment.center,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width-300,
                            child: Text(
                              "${controller.cartList[index].title}",
                              style: const TextStyle(overflow: TextOverflow.fade,
                                  fontSize: 15),overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$ ${controller.cartList[index].price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                    fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add,size: 15,),
                                  ),
                                  Text("0",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  IconButton(
                                    onPressed: () {
                                      // controller.cartList.remove(index);

                                    },
                                    icon: const Icon(Icons.remove,size: 15,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CachedNetworkImage(
//                           placeholder: (context, url) =>
//                               const CircularProgressIndicator(),
//                           imageUrl: "${controller.cartList[index].image}",
//                           height: 50,
//                           width: 50,
//                           errorWidget: (context, url, error) =>
//                               const FlutterLogo(size: 60),
//                           alignment: Alignment.center,
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Center(
//                             child: Text(
//                           "${controller.cartList[index].title}",
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),overflow: TextOverflow.ellipsis,
//                         ),),
//                         Spacer(),
//                         Column(
//                           children: [
//                             Text(
//                               "\$ ${controller.cartList[index].price}",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.orange,
//                                   fontSize: 18),overflow: TextOverflow.ellipsis,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 IconButton(onPressed: () {
//
//                                 }, icon: const Icon(Icons.add),),
//                                 TextButton(onPressed: () {
//
//                                 }, child: Text("0"),),
//                                 IconButton(onPressed: () {
//
//                                 }, icon: const Icon(Icons.remove),),
//                               ],
//                             ),
//                           ],
//                         )
//
//
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
