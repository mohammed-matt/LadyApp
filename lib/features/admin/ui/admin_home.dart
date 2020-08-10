import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:lady_ecommerce/features/admin/ui/addNewProduct.dart';
import 'package:lady_ecommerce/features/admin/ui/all_products.dart';
import 'package:lady_ecommerce/features/admin/ui/customAdminTextField.dart';
//import 'package:lady_ecommerce/components/widgets/customTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lady_ecommerce/values/constants.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pinkColor,
          title: Text('lady'),
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                'Add New Product',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              //text: 'Add New Product',
            ),
            Tab(
              child: Text(
                'All Products',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              //text: 'All Products',
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            AddNewProduct(),
            AllProducts(),
          ],
        ),
      ),
    );
  }
}
