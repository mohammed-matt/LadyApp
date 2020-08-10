import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class AdminProductItem extends StatelessWidget {
  Product product;
  AdminProductItem({this.product});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        Provider.of<AdminProvider>(context, listen: false)
            .deleteProduct(product.documentId);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(product.imageUrl),
        ),
        title: Text(product.name),
        trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
      ),
    );
  }
}
