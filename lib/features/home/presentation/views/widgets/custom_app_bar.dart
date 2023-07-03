import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user/core/utils/app_routs.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/texts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../manger/order_cubit/order_cubit.dart';
import '../../manger/order_cubit/order_state.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: 24,
              minRadius: 10,
              backgroundColor: AppColors.secondColor,
              child: Image.asset(AssetDate.logo),
            ),
            const SizedBox(
              width: 10,
            ),
            const TitleTexts(
              text: AssetDate.appName,
              fontSize: 36,
              titleColor: AppColors.blackColor,
              fontFamily: AssetDate.berlinFont,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.cartScreen);
              },
              child: Stack(
                children: [
                  const Icon(
                    Iconsax.shopping_bag,
                    color: AppColors.blackColor,
                    size: 36,
                  ),
                  BlocProvider(
                    create: (context) => OrderCubit(),
                    child: BlocConsumer<OrderCubit, OrderState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        OrderCubit cubit = OrderCubit.get(context);
                        return Positioned(
                          left: 0,
                          top: 0,
                          child: cubit.notesBox.isEmpty
                              ? const Padding(padding: EdgeInsets.zero)
                              : const CircleAvatar(
                                  maxRadius: 10,
                                  minRadius: 8,
                                  backgroundColor: AppColors.whiteColor,
                                  child: CircleAvatar(
                                    maxRadius: 8,
                                    minRadius: 6,
                                    backgroundColor: AppColors.secondColor,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
