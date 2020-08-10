import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:lady_ecommerce/features/customer/ui/productInfo.dart';
import 'package:lady_ecommerce/values/constants.dart';
import 'package:provider/provider.dart';

class ShoesView extends StatelessWidget {
  List<Product> shoesProduct = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        shoesProduct = value.shoesProducts;
        //print(shoesProduct.length);
        if (shoesProduct.isEmpty) {
          return Center(
            child: Text('No products found!!'),
          );
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductInfo.id,
                      arguments: shoesProduct[index],
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(shoesProduct[index].imageUrl),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: 0.4,
                          child: Container(
                            color: pinkColor,
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    shoesProduct[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('\$ ${shoesProduct[index].price}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: shoesProduct.length,
          );
        }
      },
    );
  }
}
