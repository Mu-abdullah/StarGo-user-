import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/texts.dart';
import '../../../manger/zalapia_cubit/zalapia_cubit.dart';
import '../custom_product_item.dart';

class Zalapia extends StatelessWidget {
  const Zalapia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ZalapiaCubit, ZalapiaState>(
        builder: (context, state) {
          return state is SuccessGetZalapia
              ? Padding(
                  padding: const EdgeInsets.all(0),
                  child: state.product.isEmpty
                      ? const Center(
                          child: TitleTexts(
                              text: "لا يوجد اصناف هنا",
                              fontFamily: AssetDate.messiriFont),
                        )
                      : ListView.builder(
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
