import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user/core/utils/constanent.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../cart/data/model/cart_model/cart_model.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  List<bool> isSelected = [true, false, false];

  void changeSize(int newIndex) {
    for (int index = 0; index < isSelected.length; index++) {
      if (index == newIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    emit(ChangeSize());
  }

  var notesBox = Hive.box<CartModel>(Constant.orderBox);

  addOrder(CartModel product) async {
    emit(LoadingAddOrder());
    try {
      await notesBox.add(product);
      emit(SuccessAddOrder());
      AppRouter.router.refresh();
    } catch (e) {
      emit(FauilerAddOrder(e.toString()));
    }
  }
}
