import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/values/strings.dart';

class AdminClient {
  AdminClient._();
  static final AdminClient adminClient = AdminClient._();
  Firestore firestore = Firestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadImage(File file) async {
    try {
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          .child('products/$dateTime.jpg')
          .putFile(file)
          .onComplete;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print(e);
    }
  }

  Future<String> addNewProduct(Product product) async {
    try {
      DocumentReference documentReference = await firestore
          .collection(productsCollectionName)
          .add(product.toJson());
      return documentReference.documentID;
    } catch (e) {
      print(e);
    }
  }

  Future<List<DocumentSnapshot>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection(productsCollectionName).getDocuments();
      print(querySnapshot);
      return querySnapshot.documents;
    } catch (e) {
      print(e);
    }
  }

  Future<List<DocumentSnapshot>> getDressProducts() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection(productsCollectionName)
          .where("category", isEqualTo: "dresses")
          .getDocuments();
      //print(querySnapshot.documents.length);
      return querySnapshot.documents;
    } catch (e) {
      print(e);
    }
  }

  Future<List<DocumentSnapshot>> getShoesProducts() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection(productsCollectionName)
          .where("category", isEqualTo: "shoes")
          .getDocuments();
      //print(querySnapshot.documents.length);
      return querySnapshot.documents;
    } catch (e) {
      print(e);
    }
  }

  Future<List<DocumentSnapshot>> getBagsProducts() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection(productsCollectionName)
          .where("category", isEqualTo: "bags")
          .getDocuments();
      //print(querySnapshot.documents.length);
      return querySnapshot.documents;
    } catch (e) {
      print(e);
    }
  }

  editProduct(Product product) async {
    try {
      firestore
          .collection(productsCollectionName)
          .document(product.documentId)
          .setData(product.toJson());
    } catch (e) {
      print(e);
    }
  }

  deleteProduct(String documentId) async {
    try {
      firestore
          .collection(productsCollectionName)
          .document(documentId)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
