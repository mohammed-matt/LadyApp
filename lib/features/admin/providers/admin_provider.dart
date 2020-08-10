import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/features/admin/repositories/admin_client.dart';
import 'package:lady_ecommerce/features/admin/repositories/admin_repository.dart';

class AdminProvider extends ChangeNotifier {
  List<Product> allProducts = [];
  List<Product> dressProducts = [];
  List<Product> shoesProducts = [];
  List<Product> bagProducts = [];
  String productName;
  String productDescription;
  double price;
  String imageUrl;
  String category;
  bool isAvailable = true;

  getAllProduct() async {
    try {
      List<Product> products =
          await AdminRepository.adminRepository.getAllProducts();
      this.allProducts = products;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  getDressProduct() async {
    try {
      List<Product> products =
          await AdminRepository.adminRepository.getDressProducts();
      this.dressProducts = products;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  getShoesProduct() async {
    try {
      List<Product> products =
          await AdminRepository.adminRepository.getShoesProducts();
      this.shoesProducts = products;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  getBagsProduct() async {
    try {
      List<Product> products =
          await AdminRepository.adminRepository.getBagsProducts();
      this.bagProducts = products;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  setProductName(String value) {
    this.productName = value;
  }

  setProductDescription(String value) {
    this.productDescription = value;
  }

  setPrice(String value) {
    this.price = double.parse(value);
  }

  setCategory(String value) {
    this.category = value;
  }

  setIsAvailable(bool value) {
    this.isAvailable = value;
  }

  uploadImage(File imageFile) async {
    String imageUrl = await AdminClient.adminClient.uploadImage(imageFile);
    this.imageUrl = imageUrl;
    notifyListeners();
  }

  Future<bool> addNewProduct() async {
    Product product = Product(
      name: this.productName,
      description: this.productDescription,
      imageUrl: this.imageUrl,
      price: this.price,
      isAvailable: this.isAvailable,
      category: this.category,
    );
    String productId = await AdminClient.adminClient.addNewProduct(product);
    if (productId != null) {
      getAllProduct();
      return true;
    } else {
      return false;
    }
  }

  deleteProduct(String documentId) async {
    await AdminClient.adminClient.deleteProduct(documentId);
    getAllProduct();
  }

  editProduct(Product product) async {
    await AdminClient.adminClient.editProduct(product);
    getAllProduct();
  }
}
