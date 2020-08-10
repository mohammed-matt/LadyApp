import 'package:flutter/material.dart';
import 'package:lady_ecommerce/features/customer/models/customer_product.dart';
import 'package:lady_ecommerce/features/customer/providers/customer_provider.dart';
import 'package:lady_ecommerce/features/customer/ui/customerCartItem.dart';
import 'package:lady_ecommerce/values/constants.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String id = 'CartScreen';
  List<DBProduct> allProducts = [];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Provider.of<CustomerProvider>(context, listen: false).getProductsFromDB();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: pinkColor, fontSize: 25),
        ),
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Consumer<CustomerProvider>(
        builder: (context, value, child) {
          allProducts = value.allDbProducts;
          if (allProducts.isEmpty) {
            return Center(
              child: Text('No prducts'),
            );
          } else {
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        return CustomerCartItem(
                          dbProduct: allProducts[index],
                        );
                      }),
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    height: 90,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Price:',
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                  '  ${getTotallPrice(allProducts).toString()}\$',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: RaisedButton(
                              child: Text(
                                'Buy',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                showCustomDialog(allProducts, context);
                              },
                              color: pinkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        )
                        //Text(getTotallPrice(allProducts).toString()),
                      ],
                    )),
                // Builder(builder: (context) {
                //   return ButtonTheme(
                //     minWidth: screenWidth,
                //     height: screenHeight * 0.09,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //       ),
                //     ),
                //     child: RaisedButton(
                //       onPressed: () {
                //         //print(allProducts.length);
                //         showCustomDialog(allProducts, context);
                //         // CustomerProvider customerProvider =
                //         //     Provider.of<CustomerProvider>(context, listen: false);
                //         // customerProvider.addOrderToFs(allProducts);
                //       },
                //       child: Text(
                //         'Buy',
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       color: pinkColor,
                //     ),
                //   );
                // }),
                //Padding(padding: EdgeInsets.only(bottom: 10))
              ],
            );
          }
        },
      ),
    );
  }

  void showCustomDialog(List<DBProduct> products, context) async {
    var price = getTotallPrice(products);
    var address;
    AlertDialog alertDialog = AlertDialog(
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            try {
              CustomerProvider customerProvider =
                  Provider.of<CustomerProvider>(context, listen: false);
              customerProvider.addOrderToFs(allProducts);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Orderd Successfully'),
              ));
              Navigator.pop(context);
            } catch (ex) {
              print(ex.message);
            }
          },
          child: Text('Confirm'),
        )
      ],
      title: Text('Totall Price  = \$ $price'),
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  getTotallPrice(List<DBProduct> products) {
    double price = 0;
    for (var product in products) {
      price += double.parse(product.productPrice);
    }
    return price;
  }
}
