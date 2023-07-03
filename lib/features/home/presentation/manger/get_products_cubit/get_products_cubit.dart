import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../data/model/products/product_model.dart';
import 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  static GetProductsCubit get(context) => BlocProvider.of(context);

  void fetchDocuments({String? categry}) {
    CollectionReference collection =
        FirebaseFirestore.instance.collection(Constant.productKey);

    Query query = collection;

    if (categry != null && categry.isNotEmpty) {
      query = query.where('category', isEqualTo: categry);
    }

    query.get().then((querySnapshot) {
      final List<ProductModel> documents = [];
      for (var doc in querySnapshot.docs) {
        ProductModel product =
            ProductModel.fromFirestore(doc.data() as Map<String, dynamic>);
        documents.add(product);
      }
      emit(SuccessGetProducts(documents));
    }).catchError((error) {
      emit(FailedGetProducts(error.toString()));
    });
  }
}
