import 'package:flutter/material.dart';
import 'package:lady_ecommerce/features/customer/models/customer_product.dart';
import 'package:lady_ecommerce/features/customer/models/order.dart';
import 'package:lady_ecommerce/features/customer/repositories/customer_repository.dart';

class CustomerProvider extends ChangeNotifier {
  List<DBProduct> allDbProducts = [];

  Future<List<DBProduct>> getProductsFromDB() async {
    List<DBProduct> products = await CustomerRepository.customerRepository
        .getAllProductsInShoppingCart();
    allDbProducts = products;
    notifyListeners();

    return products;
  }

  addProductToCart(DBProduct product) async {
    await CustomerRepository.customerRepository.addNewProduct(product);
    getProductsFromDB();
  }

  addOrderToFs(List<DBProduct> cartProducts) async {
    print(cartProducts.length);
    DateTime dateTime = DateTime.now();
    Order order = Order(
        address: 'gaza',
        date: '$dateTime',
        products: cartProducts,
        userId: 'ddd');
    CustomerRepository.customerRepository.addNewOrder(order);
  }
}
