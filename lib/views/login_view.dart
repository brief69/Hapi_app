

// login_view.dart
import 'package:ddz/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationViewModelProvider = Provider((ref) => AuthenticationViewModel());

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authenticationViewModelProvider);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                bool success = await authViewModel.signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
                if (success) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  // エラーメッセージの表示など
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
