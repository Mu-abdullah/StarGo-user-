part of 'sweets_cubit.dart';

abstract class SweetState extends Equatable {
  const SweetState();

  @override
  List<Object> get props => [];
}

class SweetsInitial extends SweetState {}
class LoadingGetSweet extends SweetState {}

class SuccessGetSweet extends SweetState {
 final List<ProductModel> product;
 const SuccessGetSweet(this.product);
}

class FailedGetSweet extends SweetState {
  final String errMessage;
  const FailedGetSweet(this.errMessage);
}
