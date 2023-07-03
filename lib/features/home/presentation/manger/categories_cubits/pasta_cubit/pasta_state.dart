part of 'pasta_cubit.dart';

abstract class PastaState extends Equatable {
  const PastaState();

  @override
  List<Object> get props => [];
}

class PastaInitial extends PastaState {}
class LoadingGetPasta extends PastaState {}

class SuccessGetPasta extends PastaState {
 final List<ProductModel> product;
 const SuccessGetPasta(this.product);
}

class FailedGetPasta extends PastaState {
  final String errMessage;
  const FailedGetPasta(this.errMessage);
}
