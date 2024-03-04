import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/core/routes/app_routes.dart';
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
          return (viewModel.isNavigating)
              ? const CircularProgressIndicator()
              : Padding(
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
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        onChanged: (value) => viewModel.setPassword(value),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: viewModel.isLoginEnabled()
                            ? () => viewModel.login(context)
                            : null,
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Signup',
                                style: const TextStyle(
                                  color: Colors.blue, // Make text color blue
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.signup);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
