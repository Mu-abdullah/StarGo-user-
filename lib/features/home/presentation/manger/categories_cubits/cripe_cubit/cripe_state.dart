part of 'cripe_cubit.dart';

abstract class CripeState extends Equatable {
  const CripeState();

  @override
  List<Object> get props => [];
}

class CripeInitial extends CripeState {}
class LoadingGetCripe extends CripeState {}

class SuccessGetCripe extends CripeState {
 final List<ProductModel> product;
 const SuccessGetCripe(this.product);
}

class FailedGetCripe extends CripeState {
  final String errMessage;
  const FailedGetCripe(this.errMessage);
}
