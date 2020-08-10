import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/components/widgets/customeDrawer.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:lady_ecommerce/features/customer/ui/bagsView.dart';
import 'package:lady_ecommerce/features/customer/ui/cartScreen.dart';
import 'package:lady_ecommerce/features/customer/ui/dressView.dart';
import 'package:lady_ecommerce/features/customer/ui/shoesView.dart';
import 'package:lady_ecommerce/values/constants.dart';
import 'package:provider/provider.dart';

class CustomerHome extends StatefulWidget {
  static String id = 'CustomerHome';
  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  List<Product> listProduct = [];

  int _tabBarIndex = 0;

  int _bottomBarIndex = 0;

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //Provider.of<AdminProvider>(context, listen: false).getAllProduct();
    Provider.of<AdminProvider>(context, listen: false).getDressProduct();
    Provider.of<AdminProvider>(context, listen: false).getShoesProduct();
    Provider.of<AdminProvider>(context, listen: false).getBagsProduct();

    // TODO: implement build
    return Stack(
      children: <Widget>[
        DefaultTabController(
          length: 3,
          child: Scaffold(
            key: drawerKey,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _bottomBarIndex,
              fixedColor: pinkColor,
              onTap: (value) {
                _bottomBarIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  title: Text('test1'),
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  title: Text('test2'),
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  title: Text('test3'),
                  icon: Icon(Icons.person),
                ),
              ],
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Container(
                width: 100,
                height: 50,
                child: Image(
                  image: AssetImage('assets/images/lady.png'),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actionsIconTheme: IconThemeData(color: Colors.black),
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(
                onPressed: () {
                  drawerKey.currentState.openDrawer();
                },
                icon: Icon(EvaIcons.menu2Outline),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.id);
                  },
                  icon: Icon(EvaIcons.shoppingBagOutline),
                ),
              ],
              bottom: TabBar(
                onTap: (value) {
                  _tabBarIndex = value;
                },
                tabs: [
                  Tab(
                    child: Text(
                      'Dresses',
                      style: TextStyle(fontSize: 20, color: pinkColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Shoes',
                      style: TextStyle(fontSize: 20, color: pinkColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'bags',
                      style: TextStyle(fontSize: 20, color: pinkColor),
                    ),
                  ),
                ],
              ),
            ),
            drawerEdgeDragWidth: 0,
            drawer: CustomeDrawer(),
            body: TabBarView(
              children: [
                DressView(),
                ShoesView(),
                BagsView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
