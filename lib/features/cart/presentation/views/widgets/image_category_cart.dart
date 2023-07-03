import 'package:flutter/material.dart';
import '../../../data/model/cart_model/cart_model.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constanent.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({
    super.key,
    required this.product ,
  });

  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      product.category == Constant.pizzaCategory
          ? AssetDate.pizza
          : product.category == Constant.cripeCategory
              ? AssetDate.cripe
              : product.category == Constant.saltyPanCakeCategory
                  ? AssetDate.panCake
                  : product.category == Constant.sweetPanCakeCategory
                      ? AssetDate.panCake
                      : AssetDate.pasta,
    );
  }
}