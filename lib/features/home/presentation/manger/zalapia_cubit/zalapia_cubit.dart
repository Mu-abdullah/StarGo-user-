import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/constanent.dart';
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
}
