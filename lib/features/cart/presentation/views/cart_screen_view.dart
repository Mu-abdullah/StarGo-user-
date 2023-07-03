import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/core/widgets/custom_snack_bar.dart';
import 'package:user/features/cart/presentation/views/widgets/cart_screen_body.dart';

import '../../data/model/cart_model/cart_model.dart';
import '../manger/cart_cubit/cart_screen_cubit.dart';

class CartScreenView extends StatefulWidget {
  const CartScreenView({super.key});

  @override
  State<CartScreenView> createState() => _CartScreenViewState();
}

class _CartScreenViewState extends State<CartScreenView> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<CartScreenCubit>(context).fetchAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreenCubit, CartScreenState>(
      listener: (context, state) {
        if (state is SuccessSendData) {
          snackBar(
            context,
            contentText: "تم ارسال طلبك\n\nانتظرنا خلال 30 دقيقة",
            seconds: 10,
          );
        } else if (state is FaulierSendData) {
          snackBar(
            context,
            contentText: "يوجد مشكلة في ارسال طلبك",
            seconds: 5,
          );
        }
      },
      builder: (context, state) {
        List<CartModel> order =
            BlocProvider.of<CartScreenCubit>(context).orders;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              body: CardScreenBody(order: order),
            ),
          ),
        );
      },
    );
  }
}
