// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OfferController on _OfferControllerBase, Store {
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

  final _$_OfferControllerBaseActionController =
      ActionController(name: '_OfferControllerBase');

  @override
  dynamic buy() {
    final _$actionInfo = _$_OfferControllerBaseActionController.startAction(
        name: '_OfferControllerBase.buy');
    try {
      return super.buy();
    } finally {
      _$_OfferControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
offer: ${offer}
    ''';
  }
}
