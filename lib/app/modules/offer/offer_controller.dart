import 'package:marketplace_nuconta/app/core/models/offer.dart';
import 'package:mobx/mobx.dart';

part 'offer_controller.g.dart';

class OfferController = _OfferControllerBase with _$OfferController;

abstract class _OfferControllerBase with Store {

  @observable
  Offer? offer;

  @action
  buy() {

  }
}
