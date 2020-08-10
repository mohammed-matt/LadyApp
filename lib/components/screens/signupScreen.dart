import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lady_ecommerce/components/screens/loginScreen.dart';
import 'package:lady_ecommerce/components/widgets/customTextField.dart';
import 'package:lady_ecommerce/services/auth.dart';

//import 'package:lady_app/repositories/auth.dart';
//import 'package:lady_app/ui/widgets/customTextField.dart';
enum textFieldType { name, username, email, password }

class SignupScreen extends StatelessWidget {
  static String id = 'SignupScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _email;
  String _pass;
  //SignupScreen({this.name, this.pass});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lady'),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: height * 0.04),
            CustomTextField(
              //type: textFieldType.name,
              hint: 'Name',
              icon: Icons.person,
            ),
            SizedBox(height: height * 0.015),
            CustomTextField(
              //type: textFieldType.username,
              hint: 'Username',
              icon: Icons.person,
            ),
            SizedBox(height: height * 0.015),
            CustomTextField(
              onClick: (value) {
                _email = value;
              },
              hint: 'E-mail',
              icon: Icons.alternate_email,
            ),
            SizedBox(height: height * 0.015),
            CustomTextField(
              onClick: (value) {
                _pass = value;
              },
              hint: 'Password',
              icon: Icons.lock,
            ),
            SizedBox(height: height * 0.015),
            CustomTextField(
              hint: '',
              icon: Icons.fiber_manual_record,
            ),
            SizedBox(height: height * 0.025),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 52,
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.green[200],
                  onPressed: () async {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      try {
                        String result = await Auth.auth
                            .createUserWithEmailAndPassword(_email, _pass);
                        print('$_email  $_pass');
                        print(result);
                        Navigator.pushNamed(context, LoginScreen.id);
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              e.toString(),
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
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
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(height: height * 0.03),
                Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                FlatButton(
                    child: Text(
                      'Login Now',
                      style: TextStyle(color: Color(0xffECC4DA), fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
