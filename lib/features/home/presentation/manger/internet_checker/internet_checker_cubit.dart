import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_checker_state.dart';

class InternetCheckerCubit extends Cubit<InternetCheckerState> {
  InternetCheckerCubit() : super(InternetCheckerInitial());
  
  StreamSubscription? connection;
  bool isoffline = false;
  void internetChecker() {
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        isoffline = true;
        emit(OffLine());
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        isoffline = false;
        emit(Online());
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        isoffline = false;
        emit(Online());
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        isoffline = false;
        emit(Online());
      } 
    });
  }
}
