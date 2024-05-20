import 'package:assesment/blocs/authentication/authentication_bloc.dart';
import 'package:assesment/blocs/authentication/authentication_event.dart';
import 'package:assesment/blocs/authentication/authentication_state.dart';
import 'package:assesment/repositories/authentication_repository.dart';
import 'package:assesment/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository(AuthenticationService());

  runApp(
    BlocProvider(
      create: (context) =>
          AuthenticationBloc(authenticationRepository)..add(AppStarted()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return const SplashScreen();
          } else if (state is AuthenticationLoading) {
            return const LoadingScreen();
          } else if (state is AuthenticationAuthenticated) {
            return const HomeScreen();
          } else if (state is AuthenticationUnauthenticated) {
            return const LoginScreen();
          }
          return Container();
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home Screen')),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final token =
                'user_token'; // Obtain the token from your login logic
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn(token));
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
