import 'package:flutter_get/models/product.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price!);

  int get count => cartItems.length;

  addToCard(Product product) {
    cartItems.add(product);
  }
}
