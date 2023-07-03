import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/colors.dart';
import '../../manger/categories_screens_cubit/categories_screens_cubit.dart';

class CategoriesTabViews extends StatelessWidget {
  const CategoriesTabViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesScreensCubit, CategoriesScreensState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoriesScreensCubit cubit = CategoriesScreensCubit.get(context);
        return DefaultTabController(
          length: cubit.topTabs.length,
          animationDuration: const Duration(milliseconds: 300),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: TabBar(
                indicatorColor: AppColors.primaryColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2,
                    )),
                splashBorderRadius: BorderRadius.circular(25),
                tabs: cubit.topTabs,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
              ),
              body: TabBarView(
                children: cubit.categoryScreen,
              ),
            ),
          ),
        );
      },
    );
  }
}
