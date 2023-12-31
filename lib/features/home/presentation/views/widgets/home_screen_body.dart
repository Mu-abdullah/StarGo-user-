import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import 'carcousal_slider.dart';
import 'categories_tab_view.dart';
import 'custom_app_bar.dart';
import 'extention_button.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Stack(
          children: [
            Container(
              height: CustomSize().heightSize(context, .1),
              width: CustomSize().widthSize(context, 1),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: AppColors.primaryColor),
            ),
            const CarouselSliderWidget(),
          ],
        ),
        const ExtentionButton(),
        const Expanded(
          child: CategoriesTabViews(),
        ),
      ],
    );
  }
}
