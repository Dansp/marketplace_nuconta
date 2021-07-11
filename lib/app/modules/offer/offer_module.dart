import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_nuconta/app/modules/offer/offer_page.dart';

class OfferModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OfferPage()),
  ];
}
