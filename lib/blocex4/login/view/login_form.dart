import 'package:bloc_education/blocex4/login/bloc/login_bloc.dart';
import '../widgets/login_button.dart';
import '../widgets/password_input.dart';
import '../widgets/user_name_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("'Authentication Failure'"),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            UserNameInput(),
            Padding(padding: EdgeInsets.all(12)),
            PasswordInput(),
            Padding(padding: EdgeInsets.all(12)),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}
