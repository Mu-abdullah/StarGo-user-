import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/features/cart/presentation/manger/receipt_cubit/receipt_cubit.dart';

import '../../../../../core/helper/cash_helper_data.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: CustomSize().widthSize(context, .85),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.mintGreenColor.withOpacity(.2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleTexts(
                text: "الاسم : ${CashHelperData().cashHelperNameValue}",
                fontFamily: AssetDate.messiriFont,
              ),
              TitleTexts(
                text: "رقم الهاتف : ${CashHelperData().cashHelperPhoneValue}",
                fontFamily: AssetDate.messiriFont,
              ),
              TitleTexts(
                text: "العنوان : ${CashHelperData().cashHelperAdressValue}",
                fontFamily: AssetDate.messiriFont,
              ),
              TitleTexts(
                text:
                    "الإجمالي : ${BlocProvider.of<ReceiptCubit>(context).total()} جنيه",
                fontFamily: AssetDate.messiriFont,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
