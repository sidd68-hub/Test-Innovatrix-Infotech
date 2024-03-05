import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/modules/profile/view_model/profile_view_model.dart';

final profileViewModelProvider =
    ChangeNotifierProvider((ref) => ProfileViewModel());

final profileInitializationProvider = FutureProvider((ref) async {
  final viewModel = ref.read(profileViewModelProvider);
  await viewModel.getId();
  return viewModel;
});

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<ProfileViewModel> profileViewModel =
              ref.watch(profileInitializationProvider);
          return profileViewModel.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
            data: (viewModel) => _buildProfileScreen(viewModel),
          );
        },
      ),
    );
  }

  Widget _buildProfileScreen(ProfileViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: viewModel.nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: (value) => viewModel.setName(value),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: viewModel.emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: (value) => viewModel.setEmail(value),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: viewModel.passwordController,
            decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: InkWell(
                  onTap: () {
                    viewModel.isShowPassword();
                  },
                  child: (viewModel.isVisible)
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.abc),
                )),
            obscureText: viewModel.isVisible,
            onChanged: (value) => viewModel.setPassword(value),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: viewModel.phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            onChanged: (value) => viewModel.setPhoneNumber(value),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              viewModel.updateDb();
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
