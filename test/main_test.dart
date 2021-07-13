

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_nuconta/app/core/models/customer/customer.dart';
import 'package:marketplace_nuconta/app/core/models/offer/offer.dart';
import 'package:marketplace_nuconta/app/core/services/customer_service.dart';
import 'package:marketplace_nuconta/app/modules/offer/offer_controller.dart';

void main() {

  test('Shall get customer json on api', () async {
    expect(await CustomerService().getCustomer(), isA<Map<String, dynamic>>());
  });

  test('Shall expire in 1 minute', () async {
    Offer offer = Offer();
    offer.expired = false;
    offer.initCounter(1);
    await Future.delayed(const Duration(seconds: 70));
    expect(offer.expired, isTrue);
  }, timeout: Timeout(const Duration(minutes: 2)));

  test('Shall make a calculate in balance when buy', () async {
    Customer customer = Customer();
    customer.balance = 1000000;
    OfferController offerController = OfferController();
    expect(customer.balance, isNotNull);
    expect(await offerController.buy(customer.balance!, 50000), isTrue);
    expect(await offerController.buy(customer.balance!, 1500000), isFalse);
    expect(offerController.balance >= 0, isTrue);
  });
}