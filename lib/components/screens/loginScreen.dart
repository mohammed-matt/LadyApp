import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lady_ecommerce/components/screens/signupScreen.dart';
import 'package:lady_ecommerce/components/widgets/customTextField.dart';
import 'package:lady_ecommerce/features/admin/ui/admin_home.dart';
import 'package:lady_ecommerce/features/customer/ui/customer_home.dart';
import 'package:lady_ecommerce/services/auth.dart';
import 'package:lady_ecommerce/services/auth.dart';
//import 'package:lady_app/repositories/auth.dart';
//import 'package:lady_app/ui/widgets/customTextField.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 130),
              child: Image(
                image: AssetImage('assets/images/lady_image.png'),
                width: 167,
                height: 99,
              ),
            ),
            SizedBox(height: height * 0.04),
            CustomTextField(
              onClick: (value) {
                _email = value;
              },
              hint: 'E-mail',
              icon: Icons.person,
            ),
            SizedBox(height: height * 0.02),
            CustomTextField(
              onClick: (value) {
                _password = value;
              },
              hint: 'Password',
              icon: Icons.lock,
            ),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 15)),
                Checkbox(
                  value: false,
                  onChanged: (null),
                ),
                Text(
                  'Remember Me',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  width: 95,
                ),
                Text('Forgot your password?',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            SizedBox(height: height * 0.02),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 52,
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.green[200],
                  onPressed: () async {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      try {
                        String result = await Auth.auth
                            .signInUsingEmailAndPassword(_email, _password);
                        print('$_email  $_password');
                        print(result);
                        Navigator.pushReplacementNamed(
                            context, CustomerHome.id);
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Social Login',
                  style: TextStyle(fontSize: 16, color: Color(0xffECC4DA)),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      iconSize: 40,
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Color(0xff76A9EA),
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: FaIcon(
                        FontAwesomeIcons.googlePlus,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        bool x = await Auth.auth.loginUsingGmail();
                        print(x);
                        Navigator.pushReplacementNamed(context, AdminHome.id);
                      },
                    )
                  ],
                ),
                SizedBox(height: height * 0.05),
                Text(
                  'New User?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                FlatButton(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Color(0xffECC4DA), fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.id);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
