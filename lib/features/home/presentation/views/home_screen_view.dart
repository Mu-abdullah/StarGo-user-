import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/no_internet_screen.dart';
import '../manger/internet_checker/internet_checker_cubit.dart';
import '../manger/internet_checker/internet_checker_state.dart';
import 'widgets/screen_body.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({
    super.key,
  });

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCheckerCubit, InternetCheckerState>(
      listener: (context, state) {
        if (state is OffLine) {
          snackBar(
            context,
            contentText: "برجاء التحقق من الاتصال بالإنترنت",
            seconds: 5,
          );
        }
      },
      builder: (context, state) {
        return state is OffLine
            ? const Scaffold(
                body: NoInternetScreen(),
              )
            : const HomeScreen();
      },
    );
  }
}
