import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  late final GraphQLClient _client;

  GraphQLService() {
    final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }

  Future<Map<String, dynamic>> getCharacters() async {
    const String query = r'''
        query {
  characters() {
    results {
      name
      image 
    }
  }
  
}
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data!;
  }
}
