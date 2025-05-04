import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommerce/core/di/service_locator.dart';

import '../cubits/cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("welcome ${state.responseUserModel.name}")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeView()),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Login")),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const EmailForm(),
                  const SizedBox(height: 16),
                  const PasswordForm(),
                  const SizedBox(height: 24),
                  state is LoginLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            // final email = emailController.text.trim();
                            // final password = passwordController.text.trim();
                            context.read<LoginCubit>().login();
                          },
                          child: const Text('Login'),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<LoginCubit>().password = value;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }
}

class EmailForm extends StatelessWidget {
  const EmailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<LoginCubit>().email = value;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(
        child: Text("Welcome to the Home Screen!"),
      ),
    );
  }
}
