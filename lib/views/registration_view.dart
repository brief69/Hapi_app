

// registration_view.dart
import 'package:ddz/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationViewModelProvider = Provider((ref) => AuthenticationViewModel());

class RegistrationView extends ConsumerWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authenticationViewModelProvider);
    final navigator = Navigator.of(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
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
              child: const Text('Register'),
              onPressed: () async {
                bool success = await authViewModel.signUp(
                  email: emailController.text,
                  password: passwordController.text,
                );
                if (success) {
                  navigator.pushReplacementNamed('/home');
                } else {
                  // error code
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
