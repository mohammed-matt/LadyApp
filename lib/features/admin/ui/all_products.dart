import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:lady_ecommerce/features/admin/ui/admin_product_item.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false).getAllProduct();

    return Consumer<AdminProvider>(
      builder: (context, value, child) {
        print(value.allProducts.length);

        List<Product> allProducts = value.allProducts;
        print(allProducts.length);
        if (allProducts.isEmpty) {
          return Center(
            child: Text('No products found!!'),
          );
        } else {
          return ListView.builder(
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                return AdminProductItem(
                  product: allProducts[index],
                );
              });
        }
      },
    );
  }
}
