import 'package:mobx/mobx.dart';
import '../offer/offer.dart';

part 'customer.g.dart';

class Customer = _Customer with _$Customer;

abstract class _Customer with Store {
  String? id;
  String? name;

  @observable
  int? balance;

  @observable
  ObservableList<Offer> offers = ObservableList();

  _Customer({this.id, this.name, this.balance});

  _Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    balance = json['balance'];
    offers.clear();
    json['offers'].forEach((v) {
      offers.add(Offer.fromJson(v));
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