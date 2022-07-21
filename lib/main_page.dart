import 'package:flutter_shopping_cart/shopping_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'cart_controller.dart';


class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(12),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24)),
                                  Text(
                                      '${controller.products[index].productDescription}'),
                                ],
                              ),
                              Text(
                                '\$${controller.products[index].price}',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addToItem(controller.products[index]);
                            },
                            child: Text('Add to Cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(height: 30),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total Amount: \$ ${controller.totalPrice}',
              style: TextStyle(fontSize: 25, color: Colors.white),
            );
          }),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            'item: ${controller.count}',
            style: TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.green,
      ),
    );
  }
}