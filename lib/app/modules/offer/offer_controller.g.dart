// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OfferController on _OfferControllerBase, Store {
  final _$balanceAtom = Atom(name: '_OfferControllerBase.balance');

  @override
  int get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(int value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$offerAtom = Atom(name: '_OfferControllerBase.offer');

  @override
  Offer? get offer {
    _$offerAtom.reportRead();
    return super.offer;
  }

  @override
  set offer(Offer? value) {
    _$offerAtom.reportWrite(value, super.offer, () {
      super.offer = value;
    });
  }

  final _$buyAsyncAction = AsyncAction('_OfferControllerBase.buy');

  @override
  Future<bool> buy(int balance, int price) {
    return _$buyAsyncAction.run(() => super.buy(balance, price));
  }

  @override
  String toString() {
    return '''
balance: ${balance},
offer: ${offer}
    ''';
  }
}
