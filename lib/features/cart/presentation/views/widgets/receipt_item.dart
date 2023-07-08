import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../data/model/cart_model/cart_model.dart';

class ReceiptOrder extends StatelessWidget {
  const ReceiptOrder({
    super.key,
    required this.cart,
  });

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTexts(
                text: "${cart.name}",
                fontFamily: AssetDate.messiriFont,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SubTitleTexts(
                    text: "السعر ( ${cart.price!.round()} جنيه )",
                    fontFamily: AssetDate.messiriFont,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SubTitleTexts(
                    text: "عدد ( ${cart.quantity?? "1"} )",
                    fontFamily: AssetDate.messiriFont,
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomDivider(
          thickness: CustomSize().widthSize(context, .01),
          color: AppColors.primaryColor,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
