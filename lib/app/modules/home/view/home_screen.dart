import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/core/service/graphQl/graphql_service.dart';
import 'package:task_innovatrix_infotech/app/modules/home/view_model/home_view_model.dart';

final homeViewModelProvider = ChangeNotifierProvider((ref) => HomeViewModel());

final graphQLServiceProvider = Provider<GraphQLService>((ref) {
  return GraphQLService();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphQLService = ref.watch(graphQLServiceProvider);
    final viewModel = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                viewModel.navigateToProfile(context);
              },
              icon: const Icon(Icons.person_outline))
        ],
        title: const Text('Home Screen'),
      ),
      body: FutureBuilder(
        future: graphQLService.getCharacters(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data['characters']['results'];

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final character = data[index];
                return ListTile(
                  title: Text(character['name'] ?? ''),
                  leading: Image.network(character['image'] ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
