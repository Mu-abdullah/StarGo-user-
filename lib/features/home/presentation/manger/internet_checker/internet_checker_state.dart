

import 'package:equatable/equatable.dart';

abstract class InternetCheckerState extends Equatable {
  const InternetCheckerState();

  @override
  List<Object> get props => [];
}

class InternetCheckerInitial extends InternetCheckerState {}
class Online extends InternetCheckerState {}
class OffLine extends InternetCheckerState {}

