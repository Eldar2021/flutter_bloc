import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity;
  StreamSubscription? streamSubscription;

  InternetCubit(this.connectivity) : super(InternetInitial()) {
    monitorInternet();
  }

  Future<StreamSubscription<ConnectivityResult>> monitorInternet() async {
    return streamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(const InternetConnected(result: ConnectivityResult.wifi));
      } else if (event == ConnectivityResult.mobile) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(const InternetConnected(result: ConnectivityResult.mobile));
      } else if (event == ConnectivityResult.none) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(const InternetDisconnected(result: ConnectivityResult.none));
      } else if (event == ConnectivityResult.ethernet) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(const InternetDisconnected(result: ConnectivityResult.ethernet));
      } else {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(const InternetError(error: "your are not internet"));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
