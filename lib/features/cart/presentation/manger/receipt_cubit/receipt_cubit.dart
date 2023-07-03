import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/cart_model/cart_model.dart';
import '../cart_cubit/cart_screen_cubit.dart';

part 'receipt_state.dart';

class ReceiptCubit extends Cubit<ReceiptState> {
  ReceiptCubit() : super(ReceiptInitial());

  List<CartModel> order = CartScreenCubit().ordersBox.values.toList();
  var ordersBox = CartScreenCubit().ordersBox.values;
  double total() {
    double totalPrice = order.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.totalPrice as double));

    return totalPrice;
  }
}
