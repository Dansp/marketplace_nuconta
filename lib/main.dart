import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/modules/customer.dart';
import 'package:pretty_json/pretty_json.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Marketplace NuConta',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Marketplace NuConta'),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String? websocketEndpoint = 'https://staging-nu-needful-things.nubank.com.br/query';

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
    Customer customer = Customer.fromJson(result.data!['viewer']);
    log(prettyJson(customer.toJson(), indent: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'NUBANK',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
