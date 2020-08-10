import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/features/admin/repositories/admin_client.dart';

class AdminRepository {
  AdminRepository._();
  static final AdminRepository adminRepository = AdminRepository._();

  Future<List<Product>> getAllProducts() async {
    try {
      List<DocumentSnapshot> documents =
          await AdminClient.adminClient.getAllProducts();
      List<Product> products =
          documents.map((e) => Product.fromDocumetSnapshot(e)).toList();
      return products;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getDressProducts() async {
    try {
      List<DocumentSnapshot> documents =
          await AdminClient.adminClient.getDressProducts();
      List<Product> products =
          documents.map((e) => Product.fromDocumetSnapshot(e)).toList();
      return products;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getShoesProducts() async {
    try {
      List<DocumentSnapshot> documents =
          await AdminClient.adminClient.getShoesProducts();
      List<Product> products =
          documents.map((e) => Product.fromDocumetSnapshot(e)).toList();
      return products;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> getBagsProducts() async {
    try {
      List<DocumentSnapshot> documents =
          await AdminClient.adminClient.getBagsProducts();
      List<Product> products =
          documents.map((e) => Product.fromDocumetSnapshot(e)).toList();
      return products;
    } catch (e) {
      print(e);
    }
  }
}
