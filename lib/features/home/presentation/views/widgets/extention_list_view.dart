import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constanent.dart';
import '../../../../../core/widgets/custom_circle_progress.dart';
import '../../../../../core/widgets/error_get_data.dart';
import '../../manger/extentions_cubit/extentions_cubit.dart';
import 'extention_list_view_item.dart';

class ExtentionListView extends StatefulWidget {
  const ExtentionListView({
    super.key,
  });

  @override
  State<ExtentionListView> createState() => _ExtentionListViewState();
}

class _ExtentionListViewState extends State<ExtentionListView> {
  @override
  void initState() {
    BlocProvider.of<ExtentionsCubit>(context)
        .fetchDocuments(category: Constant.extentionsKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExtentionsCubit, ExtentionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SuccessGetProducts) {
          return Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: state.product.length,
              itemBuilder: (context, index) {
                final product = state.product;
                return ExtentionListViewItem(product: product[index]);
              },
            ),
          );
        } else if (state is LoadingGetProducts) {
          return const CustomProgressIndecator();
        } else {
          return const ErrorGetData();
        }
      },
    );
  }
}
