import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lady_ecommerce/features/customer/models/customer_product.dart';
import 'package:lady_ecommerce/features/customer/repositories/customer_repository.dart';

class CustomerCartItem extends StatelessWidget {
  DBProduct dbProduct;
  CustomerCartItem({this.dbProduct});
  @override
  Widget build(BuildContext context) {
    //Provider.of<CustomerProvider>(context).getProductsFromDB();
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        CustomerRepository.customerRepository
            .deleteProductFromShoppingCart(dbProduct.productId);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Container(
            height: 150,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(dbProduct.productImage))),
          ),
          title: Text(
            dbProduct.productName,
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text('Count: ${dbProduct.productsCount.toString()}'),
          trailing: Text(
            "${dbProduct.productPrice}\$",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
