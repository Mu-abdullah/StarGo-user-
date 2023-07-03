import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/cart/data/model/cart_model/cart_model.dart';

import '../../../../core/utils/app_routs.dart';
import '../manger/cart_cubit/cart_screen_cubit.dart';
import '../manger/receipt_cubit/receipt_cubit.dart';
import 'widgets/receipt_app_bar.dart';
import 'widgets/receipt_listview.dart';
import 'widgets/user_info.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({
    super.key,
  });

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        CartScreenCubit().ordersBox.clear();
        GoRouter.of(context).refresh();
        GoRouter.of(context).replace(AppRouter.homeScreen);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CartModel> order = CartScreenCubit().ordersBox.values.toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: BlocConsumer<ReceiptCubit, ReceiptState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const ReceiptAppBar(),
                    const UserInformation(),
                    const SizedBox(
                      height: 5,
                    ),
                    ReceiptOrderListView(order: order),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
