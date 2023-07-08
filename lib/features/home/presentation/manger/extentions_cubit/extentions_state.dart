part of 'extentions_cubit.dart';

abstract class ExtentionsState extends Equatable {
  const ExtentionsState();

  @override
  List<Object> get props => [];
}

class ExtentionsInitial extends ExtentionsState {}
class LoadingGetProducts extends ExtentionsState {}

class SuccessGetProducts extends ExtentionsState {
 final List<ProductModel> product;
 const SuccessGetProducts(this.product);
}

class FailedGetProducts extends ExtentionsState {
  final String errMessage;
  const FailedGetProducts(this.errMessage);
}
