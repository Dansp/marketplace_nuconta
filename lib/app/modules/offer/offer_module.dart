import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_nuconta/app/modules/home/home_controller.dart';
import 'package:marketplace_nuconta/app/modules/offer/offer_page.dart';
import 'offer_controller.dart';


class OfferModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OfferController()),
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OfferPage()),
  ];
}
