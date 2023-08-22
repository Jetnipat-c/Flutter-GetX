import 'package:flutter/material.dart';
import 'package:flutter_get/controllers/cart_controller.dart';
import 'package:flutter_get/controllers/shopping_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      '${controller.products[index].productDescription}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${controller.products[index].price}',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  print('Add to cart');
                                  cartController
                                      .addToCard(controller.products[index]);
                                },
                                child: const Text('Add to cart'))
                          ],
                        ),
                      ),
                    );
                  });
            })),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total amount: ${controller.totalPrice}',
                style: const TextStyle(fontSize: 32, color: Colors.black),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.count.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 24),
            );
          }),
          icon: const Icon(Icons.shopping_cart_outlined),
          backgroundColor: Colors.black,
        ));
  }
}
