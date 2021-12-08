import '../bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameInput extends StatelessWidget {
  const UserNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) => context.read<LoginBloc>().add(
                LoginUserNameChanged(userName: username),
              ),
          decoration: InputDecoration(
            labelText: 'username',
            errorText: state.userName.invalid ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}
