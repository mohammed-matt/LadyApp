import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/screens/loginScreen.dart';
import 'package:lady_ecommerce/components/screens/signupScreen.dart';
import 'package:lady_ecommerce/components/screens/splashScreen.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:lady_ecommerce/features/admin/ui/admin_home.dart';
import 'package:lady_ecommerce/features/customer/providers/customer_provider.dart';
import 'package:lady_ecommerce/features/customer/ui/cartScreen.dart';
import 'package:lady_ecommerce/features/customer/ui/customer_home.dart';
import 'package:lady_ecommerce/features/customer/ui/productInfo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminProvider>(
          create: (context) {
            return AdminProvider();
          },
        ),
        ChangeNotifierProvider<CustomerProvider>(
          create: (context) {
            return CustomerProvider();
          },
        )
      ],
      child: MaterialApp(
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          AdminHome.id: (context) => AdminHome(),
          ProductInfo.id: (context) => ProductInfo(),
          CartScreen.id: (context) => CartScreen(),
          CustomerHome.id: (context) => CustomerHome(),
        },
        title: 'Flutter Demo',
        //home: CustomerHome(),
      ),
    );
  }
}
