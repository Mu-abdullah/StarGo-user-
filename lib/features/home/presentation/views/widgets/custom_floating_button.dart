import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user/core/utils/app_routs.dart';
import 'package:user/features/cart/data/model/cart_model/cart_model.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';

class CustomFloatingBotton extends StatelessWidget {
  CustomFloatingBotton({
    super.key,
  });

  final Box<CartModel> ordersBox = Hive.box<CartModel>(Constant.orderBox);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: ordersBox.isEmpty ? false : true,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
          maximumSize: MaterialStateProperty.all(
            Size(
              CustomSize().widthSize(context, .9),
              CustomSize().heightSize(context, .07),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              CustomSize().widthSize(context, .9),
              CustomSize().heightSize(context, .07),
            ),
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (_) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Iconsax.shopping_bag,
              color: AppColors.blackColor,
            ),
            SizedBox(
              width: 10,
            ),
            TitleTexts(
              text: "اذهب إلي العربة",
              fontFamily: AssetDate.messiriFont,
              fontSize: 30,
            ),
          ],
        ),
        onPressed: () {
          GoRouter.of(context).push(AppRouter.cartScreen);
        },
      ),
    );
  }
}
