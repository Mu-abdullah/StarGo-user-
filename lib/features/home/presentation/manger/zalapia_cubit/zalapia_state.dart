part of 'zalapia_cubit.dart';

abstract class ZalapiaState extends Equatable {
  const ZalapiaState();

  @override
  List<Object> get props => [];
}

class ZalapiaInitial extends ZalapiaState {}

class LoadingGetZalapia extends ZalapiaState {}

class SuccessGetZalapia extends ZalapiaState {
  final List<ProductModel> product;
  const SuccessGetZalapia(this.product);
}

class FailedGetZalapia extends ZalapiaState {
  final String errMessage;
  const FailedGetZalapia(this.errMessage);
}
