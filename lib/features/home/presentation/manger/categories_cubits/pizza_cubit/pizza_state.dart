part of 'pizza_cubit.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object> get props => [];
}

class PizzaInitial extends PizzaState {}
class LoadingGetPizza extends PizzaState {}

class SuccessGetPizza extends PizzaState {
 final List<ProductModel> product;
 const SuccessGetPizza(this.product);
}

class FailedGetPizza extends PizzaState {
  final String errMessage;
  const FailedGetPizza(this.errMessage);
}
