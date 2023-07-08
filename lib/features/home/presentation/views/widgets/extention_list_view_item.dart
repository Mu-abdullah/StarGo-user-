import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user/features/cart/data/model/cart_model/cart_model.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import '../../../data/model/products/product_model.dart';
import '../../manger/extentions_cubit/extentions_cubit.dart';

class ExtentionListViewItem extends StatelessWidget {
  const ExtentionListViewItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Iconsax.shop_add,
        color: AppColors.blackColor,
      ),
      title: Align(
          alignment: Alignment.centerRight,
          child: TitleTexts(text: "${product.name}")),
      subtitle: Align(
        alignment: Alignment.centerRight,
        child: SubTitleTexts(
          text: "${product.priceL} جنيه",
          fontFamily: AssetDate.messiriFont,
          subTitleColor: AppColors.blackColor,
        ),
      ),
      trailing: TextButton(
        onPressed: () {
          final cart = CartModel(
            name: product.name,
            price: double.parse(product.priceL),
          );
          BlocProvider.of<ExtentionsCubit>(context).addOrder(context, cart);
        },
        child: const TitleTexts(
          fontFamily: AssetDate.messiriFont,
          text: "اضف",
          titleColor: AppColors.secondColor,
        ),
      ),
    );
  }
}
