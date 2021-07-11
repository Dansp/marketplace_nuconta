import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_nuconta/app/core/models/customer/customer.dart';
import 'package:marketplace_nuconta/app/core/services/customer_service.dart';
import 'package:marketplace_nuconta/app/modules/offer/offer_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  OfferController _offerController = Modular.get();
  CustomerService _service = Modular.get();

  @observable
  Customer? customer;

  @observable
  bool isLoading = false;

  @action
  Future getCustomer() async {
    isLoading = true;
    try {
      customer = Customer.fromJson(await _service.getCustomer());
    } catch(e) {
      print(e);
    }
    isLoading = false;
  }

  @action
  selectOffer(index) {
    if(customer != null) {
      _offerController.offer = customer!.offers[index];
    }
  }
}
