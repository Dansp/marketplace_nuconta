import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_nuconta/app/core/utils/components/photo_hero.dart';
import 'package:marketplace_nuconta/app/core/utils/translations.dart';
import 'package:marketplace_nuconta/app/modules/offer/offer_controller.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  OfferController _controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.offer != null ? Column(
        children: [
          PhotoHero(height: 200, photo: _controller.offer!.product!.image!),
        ],
      ) : Container(child: Text(Translations.of(context).text('not_found'))),
    );
  }
}
