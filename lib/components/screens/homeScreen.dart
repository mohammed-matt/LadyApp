import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lady_ecommerce/components/models/product.dart';
import 'package:lady_ecommerce/features/admin/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final List<Image> imgList = [
    Image(
      image: AssetImage('assets/images/splash_image.png'),
      width: 121,
      height: 121,
    ),
    Image(
      image: AssetImage('assets/images/bag.png'),
      width: 121,
      height: 121,
    ),
    Image(
      image: AssetImage('assets/images/shoes2.png'),
      width: 121,
      height: 121,
    ),
    Image(
      image: AssetImage('assets/images/tshirt1.png'),
      width: 121,
      height: 121,
    ),
    Image(
      image: AssetImage('assets/images/tshirt2.png'),
      width: 121,
      height: 121,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context, listen: false).getAllProduct();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //title: Text('lady'),
        leading: Image(image: AssetImage('assets/images/lady.png')),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.shower),
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            )
          ],
        ),
      ),
      body: Consumer<AdminProvider>(
        builder: (context, value, child) {
          print(value.allProducts.length);
          List<Product> allProducts = value.allProducts;
          print(allProducts.length);
          if (allProducts.isEmpty) {
            return Center(
              child: Text('No products found!!'),
            );
          } else {
            return ListView.builder(
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                return ListView(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/splash_image.png'),
                      width: 375,
                      height: 570,
                    ),
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                        ),
                        items: imgList.map(
                          (e) {
                            return Container(
                              width: 334.0,
                              height: 167,
                              child: Card(
                                margin: EdgeInsets.all(10),
                                elevation: 10,
                                child: Row(
                                  children: <Widget>[
                                    e,
                                    Column(
                                      children: <Widget>[
                                        Text('Product'),
                                        Text('paragraph'),
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                                icon: FaIcon(FontAwesomeIcons
                                                    .shoppingBag),
                                                onPressed: () {}),
                                            IconButton(
                                                icon: Icon(Icons.share),
                                                onPressed: () {}),
                                            IconButton(
                                                icon: Icon(Icons.favorite),
                                                onPressed: () {}),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
