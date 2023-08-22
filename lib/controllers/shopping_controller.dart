import 'package:get/state_manager.dart';
import 'package:flutter_get/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: 'Product 1',
          productImage: 'add',
          productDescription: 'some des...',
          price: 10),
      Product(
          id: 2,
          productName: 'Product 2',
          productImage: 'add',
          productDescription: 'some des...',
          price: 20),
      Product(
          id: 3,
          productName: 'Product 3',
          productImage: 'add',
          productDescription: 'some des...',
          price: 30),
    ];

    products.assignAll(productResult);
  }
}
