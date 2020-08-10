import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lady_ecommerce/values/constants.dart';

class CustomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.circular(16),
            ),
            accountEmail: Text(
              "person@mail.com",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            accountName: Text(
              "Allice",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: NetworkImage(
                    "https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text("Home"),
            leading: Icon(EvaIcons.homeOutline),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text("Dresses"),
            leading: Icon(EvaIcons.personOutline),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text("Shoes"),
            leading: Icon(EvaIcons.bulbOutline),
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text("bags"),
            leading: Icon(EvaIcons.heartOutline),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 16 / 5,
                child: Image(image: AssetImage('assets/images/lady.png')),
                // Image.asset(
                //   "assets/banner8.jpg",
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
