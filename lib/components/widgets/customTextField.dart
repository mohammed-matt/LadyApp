import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/screens/signupScreen.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  textFieldType type;
  CustomTextField({this.hint, this.icon, this.onClick});

  String _errorMessage(String str) {
    switch (hint) {
      case 'Name':
        return 'Name is Empty!!';
      case 'Username':
        return 'Username is Empty!!';
      case 'E-mail':
        return 'E-mail is Empty!!';
      case 'Password':
        return 'Password is Empty!!';
    }
  }

  String val;
  String retValue() {
    return this.val;
  }

  @override
  Widget build(BuildContext context) {
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
            validator: (value) {
              if (value.isEmpty) {
                return _errorMessage(hint);
              }
            },
            obscureText: hint == 'Password' ? true : false,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[150],
              suffixIcon: Icon(icon),
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
