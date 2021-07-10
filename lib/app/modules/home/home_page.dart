import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_nuconta/app/core/utils/colors_theme.dart';
import 'package:marketplace_nuconta/app/core/utils/components/photo_hero.dart';
import 'package:marketplace_nuconta/app/core/utils/money_format.dart';
import 'package:marketplace_nuconta/app/core/utils/page_route_animation.dart';
import 'package:marketplace_nuconta/app/core/utils/translations.dart';
import 'package:marketplace_nuconta/app/modules/home/home_controller.dart';
import 'package:marketplace_nuconta/app/modules/offer/offer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = Modular.get();

  @override
  void initState() {
    super.initState();
    _controller.getCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: ( _) {
        return Container(
            color: ColorsTheme.primary,
            padding: EdgeInsets.all(16),
            child: _controller.isLoading ?
              Center(child: CircularProgressIndicator(semanticsLabel: Translations.of(context).text('loading'))) :
                _controller.customer != null ?  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Text('${Translations.of(context).text('hello')}, ${_controller.customer!.name}', style: TextStyle(fontSize: 30)),
                    SizedBox(height: 8),
                    Text('${MoneyFormat.changeToCurrent('R\$', _controller.customer!.balance)}', style: TextStyle(fontSize: 30)),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _controller.customer!.offers.length,
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {
                                  _controller.selectOffer(index);
                                  Navigator.of(context).push(PageRouteAnimation.scale(OfferPage()));
                                },
                                child: Card(
                                    elevation: 4,
                                    child: Container(
                                        padding: EdgeInsets.all(8),
                                        height: 250,
                                        child:
                                  Column(
                                    children: [
                                      Expanded(flex: 4, child: PhotoHero(height: 100, photo: _controller.customer!.offers[index].product!.image!)),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Text('${_controller.customer!.offers[index].product!.name}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                                            // Text('${customer!.offers[index].product!.description}', style: TextStyle(color: Colors.black)),
                                            // Text('${customer!.offers[index].price}', style: TextStyle(color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))),
                              );
                            },
                      ),
                    ),
                  ],
            ) : Center(child: Text('No items')),
            );
        }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
