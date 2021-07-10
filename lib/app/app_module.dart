import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_nuconta/app/core/services/customer_service.dart';
import 'modules/home/home_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/offer/offer_controller.dart';
import 'modules/offer/offer_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CustomerService()),
    Bind.lazySingleton((i) => HomeController()),
    Bind.lazySingleton((i) => OfferController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute("/offer", module: OfferModule()),
  ];
}
