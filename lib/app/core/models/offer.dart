import 'package:marketplace_nuconta/app/core/models/product.dart';

class Offer {
  String? id;
  int? price;
  Product? product;

  Offer({this.id, this.price, this.product});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    if(json['product'] != null) {
      product = Product.fromJson(json['product']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['product'] = this.product != null ? this.product!.toJson() : null;
    return data;
  }
}