import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user/core/helper/cash_helper_data.dart';
import 'package:user/core/utils/assets.dart';
import 'package:user/core/utils/size.dart';
import 'package:user/core/utils/texts.dart';
import '../../../../../core/utils/colors.dart';
import '../../../data/model/cart_model/cart_model.dart';
import '../../manger/cart_cubit/cart_screen_cubit.dart';
import 'finish_order_button.dart';
import 'order_list_view.dart';

class CardScreenBody extends StatelessWidget {
  const CardScreenBody({
    super.key,
    required this.order,
  });

  final List<CartModel> order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomCartAppBar(),
        const SizedBox(height: 5),
        TotalPrice(order: order),
        const SizedBox(height: 5),
        OrdersListView(order: order),
        const SizedBox(height: 5),
        FinishOrderButton(order: order)
      ],
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.order,
  });

  final List<CartModel> order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: order.isEmpty
          ? null
          : Container(
              width: CustomSize().widthSize(context, 1),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleTexts(
                  text:
                      "الإجمالي هو ${BlocProvider.of<CartScreenCubit>(context).total().round()} جنيه",
                  fontFamily: AssetDate.messiriFont,
                ),
              ),
            ),
    );
  }
}

class CustomCartAppBar extends StatelessWidget {
  const CustomCartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CashHelperData().cashHelperNameValue == null
              ? Container(
                  width: CustomSize().widthSize(context, 1),
                  decoration: const BoxDecoration(
                    color: AppColors.secondColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TitleTexts(
                      text: "سجل بياناتك لاتمام عملية الشراء",
                      fontFamily: AssetDate.messiriFont,
                      titleColor: AppColors.whiteColor,
                    ),
                  ),
                )
              : null,
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.blackColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TitleTexts(
                  text: "عربة التسوق",
                  fontSize: 36,
                  fontFamily: AssetDate.messiriFont,
                  titleColor: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Iconsax.shopping_cart, color: AppColors.primaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
