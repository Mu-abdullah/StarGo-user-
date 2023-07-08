import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../../core/function/test.dart';
import '../../../../../core/helper/cash_helper_data.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../data/model/cart_model/cart_model.dart';
import '../../../data/model/user_model.dart';

part 'cart_screen_state.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  CartScreenCubit() : super(CartScreenInitial());
  static CartScreenCubit get(context) => BlocProvider.of(context);

  List<CartModel> orders = [];
  var ordersBox = Hive.box<CartModel>(Constant.orderBox);
  fetchAllOrders() {
    orders = ordersBox.values.toList();
    emit(CartSuccess());
  }

  deletItems() {
    fetchAllOrders();
    emit(CartDeletedSuccess());
  }

  clearList() {
    ordersBox.clear();
    emit(ClearListSuccess());
  }

  void addCartListToFirestore(
      {required String note,
      required List<CartModel> cartList,
      required id}) async {
    final CollectionReference cartRef =
        FirebaseFirestore.instance.collection(Constant.orderKey);

    List<Map<String, dynamic>> orders =
        cartList.map((cart) => cart.toFirestore()).toList();

    final userDate = UserModel(
      id: id,
      userName: CashHelperData().cashHelperNameValue,
      orders: orders,
      note: note,
      timeOfOrder: DateTime.now(),
      userAdress: CashHelperData().cashHelperAdressValue,
      userphone: CashHelperData().cashHelperPhoneValue,
    );
    try {
      emit(LoadingSendData());
      await cartRef.doc(id).set(userDate.toJson());
      SendNotification().sendNotificationToTopic(
        topic: "pizzaStarGo",
        body: "اضغط هنا",
        title: "طلب جديد",
      );
      emit(SuccessSendData());
    } catch (e) {
      emit(FaulierSendData(e.toString()));
    }
  }

  double total() {
    double totalPrice = orders.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.totalPrice as double));

    return totalPrice;
  }
}
