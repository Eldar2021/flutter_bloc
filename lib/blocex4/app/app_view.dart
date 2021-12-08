import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_education/blocex4/home/home.dart';
import '../authentication/authentication_bloc/authentication_bloc.dart';
import '../login/view/login_page.dart';
import '../splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatefulWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  // final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  //
  // NavigatorState get _navigator => _navigatorKey.currentState!;
  late Widget page;

  @override
  void initState() {
    super.initState();
    page = const LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppRoute(),
    );
  }
}

class AppRoute extends StatelessWidget {
  const AppRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
            break;
          case AuthenticationStatus.unauthenticated:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
            break;
          default:
            break;
        }
      },
      child: const SplashPage(),
    );
  }
}
