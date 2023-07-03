import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class ChangeSize extends OrderState {}

class LoadingAddOrder extends OrderState {}

class SuccessAddOrder extends OrderState {}

class FauilerAddOrder extends OrderState {
  final String errorMsg;
  const FauilerAddOrder(this.errorMsg);
}

class OrderIsEmpty extends OrderState {}

class OrderHaveProducts extends OrderState {}

class AddItem extends OrderState {}

class MiunsItem extends OrderState {}



class CartLength extends OrderState {}
class ReadCartLength extends OrderState {}

