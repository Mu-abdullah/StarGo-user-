import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../../cart/data/model/cart_model/cart_model.dart';
import '../../../data/model/products/product_model.dart';

part 'zalapia_state.dart';

class ZalapiaCubit extends Cubit<ZalapiaState> {
  ZalapiaCubit() : super(ZalapiaInitial());
  void fetchDocuments({required String category}) {
    try {
      emit(LoadingGetZalapia());
      CollectionReference collection =
          FirebaseFirestore.instance.collection(Constant.productKey);
      collection
          .where('category', isEqualTo: category)
          .snapshots()
          .listen((querySnapshot) {
        final documents = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ProductModel.fromFirestore(data);
        }).toList();
        emit(SuccessGetZalapia(documents));
      });
    } catch (e) {
      emit(FailedGetZalapia(e.toString()));
    }
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
