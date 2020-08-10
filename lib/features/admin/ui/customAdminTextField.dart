import 'package:flutter/material.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class CustomAdminTextField extends StatelessWidget {
  final String hint;
  final Function onClick;
  CustomAdminTextField({this.hint, this.onClick});

  String _errorMessage(String str) {
    switch (hint) {
      case 'name':
        return 'Name is Empty!!';
      case 'category':
        return 'Ctegory is Empty!!';
      case 'description':
        return 'Description is Empty!!';
      case 'price':
        return 'Price is Empty!!';
      case 'imageUrl':
        return 'Image is Empty!!';
    }
  }

  String retValue(String value) {
    return value;
  }

  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            hint,
            style: TextStyle(color: Colors.grey),
          ),
          TextFormField(
            onSaved: onClick,
            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty) {
                return _errorMessage(hint);
              }
            },
            keyboardType:
                hint == 'price' ? TextInputType.number : TextInputType.text,
            //obscureText: hint == 'Password' ? true : false,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[150],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffECC4DA)),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
