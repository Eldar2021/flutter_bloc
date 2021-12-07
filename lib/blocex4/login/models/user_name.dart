import 'package:formz/formz.dart';

enum UserNameValidationError { empty }

class UserName extends FormzInput<String, UserNameValidationError> {
  const UserName.pure() : super.pure("");

  const UserName.dirty([String value = ""]) : super.dirty(value);

  @override
  UserNameValidationError? validator(String value) {
    return value.isNotEmpty == true ? null : UserNameValidationError.empty;
  }
}
