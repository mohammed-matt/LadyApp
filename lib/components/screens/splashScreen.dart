import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/screens/loginScreen.dart';
//import 'package:lady_app/ui/screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // static String id ='_SplashScreenState';
  @override
  void initState() {
    var delay = Duration(seconds: 3);
    Future.delayed(delay, () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/images/splash_image.png')),
            Padding(padding: EdgeInsets.all(15)),
            Image(
              image: AssetImage('assets/images/lady_image.png'),
              width: 167,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
