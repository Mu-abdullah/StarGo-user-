part of 'salt_cubit.dart';

abstract class SaltState extends Equatable {
  const SaltState();

  @override
  List<Object> get props => [];
}

class SaltInitial extends SaltState {}
class LoadingGetSalt extends SaltState {}

class SuccessGetSalt extends SaltState {
 final List<ProductModel> product;
 const SuccessGetSalt(this.product);
}

class FailedGetSalt extends SaltState {
  final String errMessage;
  const FailedGetSalt(this.errMessage);
}
