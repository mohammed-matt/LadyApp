import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lady_ecommerce/components/screens/loginScreen.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:lady_ecommerce/features/admin/ui/customAdminTextField.dart';
import 'package:lady_ecommerce/services/auth.dart';
import 'package:lady_ecommerce/values/constants.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatefulWidget {
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String name;

  String description;

  String imageUrl;

  String price;

  String category;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: _globalKey,
      child: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: height * 0.03),
            CustomAdminTextField(
              hint: 'name',
              onClick: (value) {
                name = value;
              },
            ),
            SizedBox(height: height * 0.015),
            Container(
              //margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Container(width: 330, child: Text('Category:')),
                  DropdownButton(
                    value: category,
                    items: [
                      DropdownMenuItem(
                        child: Text('Dresses'),
                        value: 'dresses',
                      ),
                      DropdownMenuItem(
                        child: Text('Shoes'),
                        value: 'shoes',
                      ),
                      DropdownMenuItem(
                        child: Text('bags'),
                        value: 'bags',
                      ),
                    ],
                    onChanged: (value) {
                      category = value;
                      setState(() {
                        category = value;
                      });
                      print(category);
                    },
                  ),
                ],
              ),
            ),
            // CustomAdminTextField(
            //   hint: 'category',
            //   onClick: (value) {
            //     category = value;
            //   },
            // ),
            SizedBox(height: height * 0.015),
            CustomAdminTextField(
              hint: 'description',
              onClick: (value) {
                description = value;
              },
            ),
            SizedBox(height: height * 0.015),
            CustomAdminTextField(
              hint: 'price',
              onClick: (value) {
                price = value;
              },
            ),
            // CustomAdminTextField(
            //   hint: 'imageUrl',
            //   onClick: (value) {
            //     imageUrl = value;
            //   },
            // ),
            SizedBox(height: height * 0.015),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 52,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: pinkColor,
                  child: Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async {
                    try {
                      PickedFile imageFile = await ImagePicker()
                          .getImage(source: ImageSource.camera);
                      File file = File(imageFile.path);
                      Provider.of<AdminProvider>(context, listen: false)
                          .uploadImage(file);
                    } catch (e) {
                      // Scaffold.of(context)
                      //     .showSnackBar(SnackBar(content: Text(e)));
                    }
                  }),
            ),
            SizedBox(height: height * 0.015),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 52,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: pinkColor,
                child: Text(
                  'Add New Product',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () async {
                  if (_globalKey.currentState.validate()) {
                    try {
                      _globalKey.currentState.save();
                      AdminProvider adminProvider =
                          Provider.of<AdminProvider>(context, listen: false);
                      adminProvider.setProductName(name);
                      adminProvider.setProductDescription(description);
                      adminProvider.setPrice(price);
                      adminProvider.setCategory(category);
                      bool x = await adminProvider.addNewProduct();
                      if (x == true) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('New Product Added Succfully')));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('New Product Added Failed!!')));
                      }
                    } catch (e) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text(e.message)));
                    }
                  }
                },
              ),
            ),
            SizedBox(height: height * 0.015),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 52,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: pinkColor,
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Auth.auth.signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
