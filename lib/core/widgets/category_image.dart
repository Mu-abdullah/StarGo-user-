import 'package:flutter/material.dart';

import '../../features/home/data/model/products/product_model.dart';
import '../utils/assets.dart';
import '../utils/constanent.dart';

class CustomCategoryImage extends StatelessWidget {
  const CustomCategoryImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

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
