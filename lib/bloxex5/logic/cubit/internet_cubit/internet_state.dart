part of 'internet_cubit.dart';

abstract class InternetState {
  const InternetState();
}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectivityResult result;
  const InternetConnected({required this.result});
}

class InternetError extends InternetState {
  final String error;
  const InternetError({required this.error});
}

class InternetDisconnected extends InternetState {
  final ConnectivityResult result;
  const InternetDisconnected({required this.result});
}
