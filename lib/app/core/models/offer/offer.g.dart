// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Offer on _Offer, Store {
  final _$expiredAtom = Atom(name: '_Offer.expired');

  @override
  bool get expired {
    _$expiredAtom.reportRead();
    return super.expired;
  }

  @override
  set expired(bool value) {
    _$expiredAtom.reportWrite(value, super.expired, () {
      super.expired = value;
    });
  }

  final _$expireAtAtom = Atom(name: '_Offer.expireAt');

  @override
  DateTime? get expireAt {
    _$expireAtAtom.reportRead();
    return super.expireAt;
  }

  @override
  set expireAt(DateTime? value) {
    _$expireAtAtom.reportWrite(value, super.expireAt, () {
      super.expireAt = value;
    });
  }

  final _$_OfferActionController = ActionController(name: '_Offer');

  @override
  dynamic initCounter(dynamic when) {
    final _$actionInfo =
        _$_OfferActionController.startAction(name: '_Offer.initCounter');
    try {
      return super.initCounter(when);
    } finally {
      _$_OfferActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expired: ${expired},
expireAt: ${expireAt}
    ''';
  }
}
