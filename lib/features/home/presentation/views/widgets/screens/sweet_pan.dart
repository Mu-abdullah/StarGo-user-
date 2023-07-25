import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/texts.dart';
import '../../../manger/categories_cubits/sweet_cubit/sweets_cubit.dart';
import '../custom_product_item.dart';

class SweetPanCake extends StatelessWidget {
  const SweetPanCake({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SweetsCubit, SweetState>(
        builder: (context, state) {
          return state is SuccessGetSweet
              ? Padding(
                  padding: const EdgeInsets.all(0),
                  child: state.product.isEmpty
                      ? const Center(
                          child: TitleTexts(
                              text: "لا يوجد اصناف هنا",
                              fontFamily: AssetDate.messiriFont),
                        )
                      : ListView.builder(
                         physics: const BouncingScrollPhysics(),
                          itemCount: state.product.length,
                          itemBuilder: (context, index) {
                            final products = state.product[index];
                            return CustomProductItem(
                              product: products,
                            );
                          },
                        ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
