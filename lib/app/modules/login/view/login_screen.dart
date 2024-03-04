import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/modules/login/view_model/login_view_model.dart';

final loginViewModelProvider =
    ChangeNotifierProvider((ref) => LoginViewModel());

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final viewModel = ref.watch(loginViewModelProvider);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (value) => viewModel.setEmail(value),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (value) => viewModel.setPassword(value),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: viewModel.isLoginEnabled()
                      ? () => viewModel.login()
                      : null,
                  child: const Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
