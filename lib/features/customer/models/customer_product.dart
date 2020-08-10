import 'package:lady_ecommerce/values/strings.dart';

class DBProduct {
  String productId;

  String productName;

  String productImage;

  String productPrice;

  int productsCount;

  DBProduct(
      {this.productImage,
      this.productId,
      this.productName,
      this.productPrice,
      this.productsCount});

  DBProduct.fromMap(Map<String, dynamic> map) {
    this.productId = map[productIdColumn];

    this.productName = map[productNameColumn];

    this.productImage = map[productImageColumn];

    this.productPrice = map[productPriceColumn];

    this.productsCount = map[countColumn];
  }

  Map<String, dynamic> toJson() {
    return {
      productIdColumn: this.productId,
      productNameColumn: this.productName,
      productImageColumn: this.productImage,
      productPriceColumn: this.productPrice,
      countColumn: this.productsCount
    };
  }
}
