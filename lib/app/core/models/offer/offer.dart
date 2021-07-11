import 'dart:async';
import 'dart:math';
import 'package:marketplace_nuconta/app/core/models/product/product.dart';
import 'package:mobx/mobx.dart';

part 'offer.g.dart';

class Offer = _Offer with _$Offer;

abstract class _Offer with Store {
  String? id;
  int? price;
  Product? product;

  @observable
  bool expired = false;

  @observable
  DateTime? expireAt;

  _Offer({this.id, this.price, this.product});

  _Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    if(json['product'] != null) {
      product = Product.fromJson(json['product']);
    }
    //Start counter
    initCounter((Random().nextInt(6))); //random of 1 to 5
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['product'] = this.product != null ? this.product!.toJson() : null;
    return data;
  }

  @action
  initCounter(when) {
    DateTime current = DateTime.now();
    expireAt = current.add(Duration(minutes: when));
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
          (Timer timer) {
        DateTime current = DateTime.now();
        if(current.isAfter(expireAt!)) {
          expired = true;
          timer.cancel();
        }
      },
    );
  }
}