import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import '../../../data/model/products/product_model.dart';

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
          Navigator.pop(context);
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
