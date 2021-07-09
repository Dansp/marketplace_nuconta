import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/app/core/models/customer.dart';
import 'package:marketplace_nuconta/app/core/services/customer_service.dart';
import 'package:marketplace_nuconta/app/core/utils/colors_theme.dart';
import 'package:pretty_json/pretty_json.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Customer? customer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadCustomer();
  }

  _loadCustomer() async {
    try {
      CustomerService().getCustomer().then((customerJson) {
        setState(() {
          customer = Customer.fromJson(customerJson);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsTheme.primary,
        padding: EdgeInsets.all(16),
        child: customer != null ?  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50),
                Text('Hello, ${customer!.name}', style: TextStyle(fontSize: 30)),
                SizedBox(height: 8),
                Text('${customer!.balance}', style: TextStyle(fontSize: 30)),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: customer!.offers.length,
                        itemBuilder: (BuildContext context, index) {
                          return Card(
                              elevation: 4,
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: 250,
                                  child:
                            Column(
                              children: [
                                Expanded(flex: 4, child: Image.network(customer!.offers[index].product!.image!, fit: BoxFit.cover)),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text('${customer!.offers[index].product!.name}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                                      Text('${customer!.offers[index].product!.description}', style: TextStyle(color: Colors.black)),
                                      Text('${customer!.offers[index].price}', style: TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ],
                            )));
                        },
                  ),
                ),
              ],
        ) : Center(child: Text('No items')),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
