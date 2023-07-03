part of 'cart_screen_cubit.dart';

abstract class CartScreenState extends Equatable {
  const CartScreenState();

  @override
  List<Object> get props => [];
}

class CartScreenInitial extends CartScreenState {}

class CartSuccess extends CartScreenState {}

class Loading extends CartScreenState {}

class CartDeletedSuccess extends CartScreenState {}

class ClearListLoading extends CartScreenState {}

class ClearListSuccess extends CartScreenState {}

class LoadingSendData extends CartScreenState {}

class SuccessSendData extends CartScreenState {}

class FaulierSendData extends CartScreenState {
  final String errMessage;
  const FaulierSendData(this.errMessage);
}

class LoadingSavedValue extends CartScreenState {}

class SuccessSavedValue extends CartScreenState {}

class FaulierSavedValue extends CartScreenState {
  final String errMessage;
  const FaulierSavedValue(this.errMessage);
}
