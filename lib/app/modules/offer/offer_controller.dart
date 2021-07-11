import 'dart:async';

import 'package:marketplace_nuconta/app/core/models/offer/offer.dart';
import 'package:mobx/mobx.dart';

part 'offer_controller.g.dart';

class OfferController = _OfferControllerBase with _$OfferController;

abstract class _OfferControllerBase with Store {

  @observable
  int balance = 0;

  @observable
  Offer? offer;

  @action
  Future<bool> buy(int balance, int price) async {
    if(balance >= price) {
      balance -= price;
      this.balance = balance;
      return true;
    }
    return false;
  }
}
