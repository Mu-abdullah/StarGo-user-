import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:user/core/utils/colors.dart';
import 'package:user/core/utils/texts.dart';

import '../../../../../core/function/random_id.dart';
import '../../../../../core/helper/cash_helper_data.dart';
import '../../../../../core/utils/app_routs.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';
import '../../../data/model/cart_model/cart_model.dart';
import '../../manger/cart_cubit/cart_screen_cubit.dart';
import 'user_detail_bottom_sheet.dart';

class FinishOrderButton extends StatelessWidget {
  FinishOrderButton({
    super.key,
    required this.order,
  });
  final TextEditingController note = TextEditingController();
  final List<CartModel> order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: order.isEmpty
          ? null
          : BlocConsumer<CartScreenCubit, CartScreenState>(
              listener: (context, state) {
                if (state is SuccessSendData) {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.receiptScreen, extra: order);
                }
              },
              builder: (context, state) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CashHelperData().cashHelperNameValue == null
                        ? null
                        : CustomTextField(
                            hint: "ملاحظات",
                            label: "ملاحظات",
                            fontFamily: AssetDate.messiriFont,
                            prefix: const Icon(Iconsax.note),
                            isPassword: false,
                            controller: note,
                            type: TextInputType.text,
                            maxLines: 1,
                            validate: (value) {
                              return null;
                            }),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    color: AppColors.secondColor.withOpacity(.5),
                    child: const TitleTexts(
                        text:
                            "ممكن يختلف سعر التوصيل علي حسب المكان من 7 جنيه إلي 15 جنيه"),
                  ),
                  const SizedBox(height: 5),
                  CustomButton(
                    arabic: false,
                    wantIcon: false,
                    width: 1,
                    loadingState: state is LoadingSendData ? true : false,
                    onPress: () {
                      if (CashHelperData().cashHelperNameValue == null) {
                        showMaterialModalBottomSheet(
                          context: context,
                          expand: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (context) {
                            return const UserDetailsBottomSheetModel();
                          },
                        );
                      } else {
                        BlocProvider.of<CartScreenCubit>(context)
                            .addCartListToFirestore(
                                note: note.text,
                                cartList: order,
                                id: generateDocumentId());
                      }
                    },
                    buttonName: CashHelperData().cashHelperNameValue == null
                        ? "سجل بياناتك"
                        : "اتمام الشراء",
                  ),
                ],
              ),
            ),
    );
  }
}
