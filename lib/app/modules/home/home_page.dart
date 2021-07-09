import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/app/core/models/customer.dart';
import 'package:marketplace_nuconta/app/core/utils/colors_theme.dart';
import 'package:pretty_json/pretty_json.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Customer? customer;

  static const String readViewer = '''
        query QueryRoot {
          viewer {
            id
            name
            balance
            offers{
              id
              price
              product{
                id
                name
                description
                image
              }
            }
          }
      }
      ''';

  @override
  void initState() {
    super.initState();
    _getMarket();
  }

  _getMarket() async {
    print('_getMarket');
    final _httpLink = HttpLink(
      'https://staging-nu-needful-things.nubank.com.br/query',
    );

    final _authLink = AuthLink(
      getToken: () async => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c',
    );

    Link _link = _authLink.concat(_httpLink);

    /// subscriptions must be split otherwise `HttpLink` will. swallow them
    // if (websocketEndpoint != null){
    //   final _wsLink = WebSocketLink(websocketEndpoint!);
    //   _link = Link.split((request) => request.isSubscription, _wsLink, _link);
    // }

    final GraphQLClient client = GraphQLClient(
      /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: _link,
    );

    final QueryOptions options = QueryOptions(
      document: gql(readViewer),
    );
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }
    log(prettyJson(result.data, indent: 2));
    customer = Customer.fromJson(result.data!['viewer']);
    // log(prettyJson(customer.toJson(), indent: 2));
    setState(() {});
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
