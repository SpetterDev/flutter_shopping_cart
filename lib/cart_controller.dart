import 'package:flutter_shopping_cart/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  double get totalPrice {
    double totalPrice = 0;
    for (var element in cartItems) {
      totalPrice += element.price;
    }
    return totalPrice;
  }

  int get count => cartItems.length;

  void addToItem(Product product) {
    cartItems.add(product);
  }
}
