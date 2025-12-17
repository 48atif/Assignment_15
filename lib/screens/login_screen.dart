import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<AuthProvider>(
          builder: (context, auth, child) {
            return Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: passwordController,
                  decoration:
                      const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                auth.loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          bool success = await auth.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );

                          if (success) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const DashboardScreen(),
                              ),
                            );
                          }
                        },
                        child: const Text("Login"),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
