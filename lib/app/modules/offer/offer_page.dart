import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_nuconta/app/core/utils/components/custom_dialog_widget.dart';
import 'package:marketplace_nuconta/app/core/utils/components/photo_hero.dart';
import 'package:marketplace_nuconta/app/core/utils/money_format.dart';
import 'package:marketplace_nuconta/app/core/utils/translations.dart';
import 'package:marketplace_nuconta/app/modules/home/home_controller.dart';
import 'package:marketplace_nuconta/app/modules/offer/offer_controller.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  OfferController _controller = Modular.get();
  HomeController _homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_controller.offer!.product!.name!), centerTitle: true),
      body: Observer(builder: ( _) {
        return _controller.offer != null ? SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Icon(Icons.account_balance_wallet),
                        Text('${MoneyFormat.changeToCurrent('R\$', _homeController.customer!.balance)}', style: TextStyle(fontSize: 30, color: Colors.black)),
                      ],),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: PhotoHero(photo: _controller.offer!.product!.image!),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_controller.offer!.product!.name!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 16),
                      Text(_controller.offer!.product!.description!),
                      SizedBox(height: 16),
                      Divider(),
                      Text('${MoneyFormat.changeToCurrent('R\$', _controller.offer!.price)}', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      Align(
                        alignment: Alignment.centerRight,
                          child: ElevatedButton(onPressed: () {
                            _controller.buy(_homeController.customer!.balance!, _controller.offer!.price!).then((success) async {
                              if(success) {
                                _homeController.customer!.balance = _controller.balance;
                                setState(() {});
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return CustomDialog(
                                      type: TypeDialog.OK,
                                      title: 'Sucesso!!!',
                                      msg:
                                      'Compra realizada com sucesso! Seu saldo atual é de: ${MoneyFormat.changeToCurrent('R\$', _homeController.customer!.balance)}',
                                      btn1: true,
                                      btn1Text: 'Ok',
                                      isNavigation: false,
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return CustomDialog(
                                      type: TypeDialog.WARNING,
                                      title: 'Ops',
                                      msg:
                                      'Você não te saldo suficiente,seu saldo atual é de: ${MoneyFormat.changeToCurrent('R\$', _homeController.customer!.balance)}',
                                      btn1: true,
                                      btn1Text: 'Ok',
                                      isNavigation: false,
                                    );
                                  },
                                );
                              }
                            });
                          }, child: Text(Translations.of(context).text('buy'))))
                    ],
                  ),
                ),

              ],
            ),
          ),
        ) : Container(child: Text(Translations.of(context).text('not_found')));
      },
    ));
  }
}
