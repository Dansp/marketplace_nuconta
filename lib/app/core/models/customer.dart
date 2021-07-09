import 'offer.dart';

class Customer {
  String? id;
  String? name;
  int? balance;
  List<Offer> offers = [];

  Customer({this.id, this.name, this.balance});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    balance = json['balance'];
    offers.clear();
    json['offers'].forEach((v) {
      offers.add(new Offer.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['balance'] = this.balance;
    data['offers'] = this.offers.map((v) => v.toJson()).toList();
    return data;
  }
}