import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String documentId;
  String name;
  String description;
  String imageUrl;
  double price;
  bool isAvailable;
  int count;
  String category;

  Product({
    this.description,
    this.documentId,
    this.imageUrl,
    this.name,
    this.price,
    this.isAvailable,
    this.count,
    this.category,
  });
  Product.fromDocumetSnapshot(DocumentSnapshot documentSnapshot) {
    this.documentId = documentSnapshot.documentID;
    this.name = documentSnapshot.data['name'];
    this.description = documentSnapshot.data['description'];
    this.imageUrl = documentSnapshot.data['imageUrl'];
    this.isAvailable = documentSnapshot.data['isAvailable'];
    this.price = documentSnapshot.data['price'];
    this.category = documentSnapshot.data['category'];
  }
  toJson() {
    return {
      'name': this.name,
      'description': this.description,
      'price': this.price,
      'imageUrl': this.imageUrl,
      'isAvailable': this.isAvailable,
      'category': this.category,
    };
  }
}
