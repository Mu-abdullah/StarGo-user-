import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/categories_screens_cubit/categories_screens_cubit.dart';
import 'custom_floating_button.dart';
import 'home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CategoriesScreensCubit, CategoriesScreensState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: CustomFloatingBotton(),
            body: const HomeScreenBody(),
          );
        },
      ),
    );
  }
}
