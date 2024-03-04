import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/modules/signup/view_model/signup_view_model.dart';

final signUpViewModelProvider =
    ChangeNotifierProvider((ref) => SignUpViewModel());

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final viewModel = ref.watch(signUpViewModelProvider);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (value) => viewModel.setName(value),
                ),
                const SizedBox(height: 20.0),
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
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  onChanged: (value) => viewModel.setPhoneNumber(value),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: viewModel.isSignUpEnabled()
                      ? () => viewModel.signUp(context)
                      : null,
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
