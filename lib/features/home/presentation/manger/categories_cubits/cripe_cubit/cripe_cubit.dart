import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/constanent.dart';
import '../../../../data/model/products/product_model.dart';

part 'cripe_state.dart';

class CripeCubit extends Cubit<CripeState> {
  CripeCubit() : super(CripeInitial());

  static CripeCubit get(context) => BlocProvider.of(context);

  void fetchDocuments({required String category}) {
    CollectionReference collection =
        FirebaseFirestore.instance.collection(Constant.productKey);
    try {
      collection
          .where('category', isEqualTo: category)
          .snapshots()
          .listen((querySnapshot) {
        final documents = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ProductModel.fromFirestore(data);
        }).toList();
        emit(SuccessGetCripe(documents));
      });
    } catch (e) {
      emit(FailedGetCripe(e.toString()));
    }
  }
}
