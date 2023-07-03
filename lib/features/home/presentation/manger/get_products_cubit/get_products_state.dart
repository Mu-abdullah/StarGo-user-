
import 'package:equatable/equatable.dart';

import '../../../data/model/products/product_model.dart';

abstract class GetProductsState extends Equatable {
  const GetProductsState();

  @override
  List<Object> get props => [];
}

class GetProductsInitial extends GetProductsState {}

class LoadingGetProducts extends GetProductsState {}

class SuccessGetProducts extends GetProductsState {
 final List<ProductModel> product;
 const SuccessGetProducts(this.product);
}

class FailedGetProducts extends GetProductsState {
  final String errMessage;
  const FailedGetProducts(this.errMessage);
}
