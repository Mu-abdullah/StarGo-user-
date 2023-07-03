import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/texts.dart';
import '../../manger/cart_cubit/cart_screen_cubit.dart';

class ReceiptAppBar extends StatelessWidget {
  const ReceiptAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TitleTexts(
            text: "فاتورة",
            fontSize: 30,
            fontFamily: AssetDate.messiriFont,
          ),
          GestureDetector(
            onTap: () {
              CartScreenCubit().ordersBox.clear();
              GoRouter.of(context).pushReplacement(AppRouter.homeScreen);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TitleTexts(
                  text: "الصفحة الرئيسية",
                  fontFamily: AssetDate.messiriFont,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Iconsax.home),
              ],
            ),
          )
        ],
      ),
    );
  }
}
