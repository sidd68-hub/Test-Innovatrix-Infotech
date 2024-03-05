import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/core/service/graphQl/graphql_service.dart';

class HomeProvider {
  final graphQLServiceProvider = Provider<GraphQLService>((ref) {
    return GraphQLService();
  });
}
