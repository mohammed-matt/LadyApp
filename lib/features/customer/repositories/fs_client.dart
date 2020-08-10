import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lady_ecommerce/features/customer/models/order.dart';
import 'package:lady_ecommerce/values/strings.dart';

class FSclient {
  FSclient._();

  static final FSclient adminClient = FSclient._();

  Firestore firestore = Firestore.instance;

  Future<String> addNewOrder(Order order) async {
    try {
      DocumentReference documentReference =
          await firestore.collection(ordersCollectionName).add(order.toJson());
      print(documentReference.documentID);
      return documentReference.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllOrders() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection(ordersCollectionName).getDocuments();

      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }
}
