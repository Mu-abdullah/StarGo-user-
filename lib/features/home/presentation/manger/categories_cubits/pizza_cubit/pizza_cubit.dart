import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constanent.dart';
import '../../../../data/model/products/product_model.dart';

part 'pizza_state.dart';

class PizzaCubit extends Cubit<PizzaState> {
  PizzaCubit() : super(PizzaInitial());
  static PizzaCubit get(context) => BlocProvider.of(context);
  void fetchDocuments({required String category}) {
    try {
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
        emit(SuccessGetPizza(documents));
      });
    } catch (e) {
      emit(FailedGetPizza(e.toString()));
    }
  
  }
}
