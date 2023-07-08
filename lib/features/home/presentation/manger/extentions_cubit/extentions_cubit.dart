import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:user/features/home/data/model/products/product_model.dart';

import '../../../../../core/utils/constanent.dart';

part 'extentions_state.dart';

class ExtentionsCubit extends Cubit<ExtentionsState> {
  ExtentionsCubit() : super(ExtentionsInitial());

  void fetchDocuments({required String category}) {
    CollectionReference collection =
        FirebaseFirestore.instance.collection(Constant.extentionsKey);
    try {
      collection
          .where('category', isEqualTo: category)
          .snapshots()
          .listen((querySnapshot) {
        final documents = querySnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ProductModel.fromFirestore(data);
        }).toList();
        emit(SuccessGetProducts(documents));
      });
    } catch (e) {
      emit(FailedGetProducts(e.toString()));
    }
  }
}
