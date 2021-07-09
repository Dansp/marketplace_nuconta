import 'package:graphql/client.dart';

class CustomerService {
  final _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c';
  final _httpLink = HttpLink(
      'https://staging-nu-needful-things.nubank.com.br/query',
  );
  final String _readViewer = '''
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

  //Get Customer with market
  Future<Map<String, dynamic>> getCustomer() async {

    //Take token for auth
    final _authLink = AuthLink(
      getToken: () async => 'Bearer $_token',
    );

    //Take link
    Link _link = _authLink.concat(_httpLink);

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );

    //Set the query in options
    final QueryOptions options = QueryOptions(
      document: gql(_readViewer),
    );
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
      throw Exception(result.exception.toString());
    }
    return result.data!['viewer'];
  }
}