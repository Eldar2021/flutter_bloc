part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.userName = const UserName.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final UserName userName;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    UserName? userName,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [status, userName, password];
}
