import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/components/widgets/customeDrawer.dart';
import 'package:lady_ecommerce/features/customer/models/customer_product.dart';
import 'package:lady_ecommerce/features/customer/providers/customer_provider.dart';
import 'package:lady_ecommerce/values/constants.dart';
import 'package:provider/provider.dart';

class ProductInfo extends StatefulWidget {
  static String id = 'ProductInfo';
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _quantity = 1;
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: drawerKey,
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
        brightness: Brightness.light,
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
            onPressed: () {},
            icon: Icon(EvaIcons.shoppingBagOutline),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: CustomeDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: NetworkImage(product.imageUrl),
                //tag: null,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    image: NetworkImage(product.imageUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Text(
                  "${product.price}\$",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: pinkColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: OutlineButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onPressed: add,
                            child: Icon(Icons.add),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            _quantity.toString().padLeft(2, "0"),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: OutlineButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            onPressed: subtract,
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RaisedButton.icon(
                        color: pinkColor,
                        icon: Icon(Icons.shopping_cart),
                        label: Text("Cart"),
                        onPressed: () {
                          num priceProduct = product.price * _quantity;
                          print(priceProduct);
                          DBProduct dbProduct = DBProduct(
                              productId: product.documentId,
                              productName: product.name,
                              productPrice: priceProduct.toString(),
                              productsCount: _quantity,
                              productImage: product.imageUrl);
                          CustomerProvider customerProvider =
                              Provider.of<CustomerProvider>(context,
                                  listen: false);
                          customerProvider.addProductToCart(dbProduct);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Description:',
                    style: TextStyle(fontSize: 22),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 0,
                ),
                child: Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  subtract() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        print(_quantity);
      });
    }
  }

  add() {
    setState(() {
      _quantity++;
      print(_quantity);
    });
  }
}
