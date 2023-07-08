import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/cart/presentation/views/receipt.dart';
import 'package:user/features/home/presentation/manger/order_cubit/order_cubit.dart';
import 'package:user/features/welcome_screen/presentation/views/welcome_screen.dart';
import '../../features/board_screen/presentation/views/board_screen.dart';
import '../../features/cart/presentation/manger/cart_cubit/cart_screen_cubit.dart';
import '../../features/cart/presentation/manger/receipt_cubit/receipt_cubit.dart';
import '../../features/cart/presentation/views/cart_screen_view.dart';
import '../../features/home/presentation/manger/categories_cubits/cripe_cubit/cripe_cubit.dart';
import '../../features/home/presentation/manger/categories_cubits/pasta_cubit/pasta_cubit.dart';
import '../../features/home/presentation/manger/categories_cubits/pizza_cubit/pizza_cubit.dart';
import '../../features/home/presentation/manger/categories_cubits/salt_cubit/salt_cubit.dart';
import '../../features/home/presentation/manger/categories_cubits/sweet_cubit/sweets_cubit.dart';
import '../../features/home/presentation/manger/categories_screens_cubit/categories_screens_cubit.dart';
import '../../features/home/presentation/manger/internet_checker/internet_checker_cubit.dart';
import '../../features/home/presentation/manger/zalapia_cubit/zalapia_cubit.dart';
import '../../features/home/presentation/views/home_screen_view.dart';
import '../../features/splash_screen/splash_screen_view.dart';
import 'constanent.dart';

abstract class AppRouter {
  static const homeScreen = '/homeScreen';
  static const cartScreen = '/cartScreen';
  static const boardScreen = '/boardScreen';
  static const receiptScreen = '/receiptScreen';
  static const splachScreen = '/splachScreen';
  static const welcomeScreen = '/welcomeScreen';

  static final router = GoRouter(
    initialLocation: splachScreen,
    routes: [
      GoRoute(
        path: homeScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => InternetCheckerCubit()..internetChecker(),
            ),
            BlocProvider(
              create: (context) => CategoriesScreensCubit(),
            ),
            BlocProvider(
              create: (context) => PizzaCubit()
                ..fetchDocuments(category: Constant.pizzaCategory),
            ),
            BlocProvider(
              create: (context) => CripeCubit()
                ..fetchDocuments(category: Constant.cripeCategory),
            ),
            BlocProvider(
              create: (context) => PastaCubit()
                ..fetchDocuments(category: Constant.pastaCategory),
            ),
            BlocProvider(
              create: (context) => SweetsCubit()
                ..fetchDocuments(category: Constant.sweetPanCakeCategory),
            ),
            BlocProvider(
              create: (context) => SaltCubit()
                ..fetchDocuments(category: Constant.saltyPanCakeCategory),
            ),
            BlocProvider(
              create: (context) => OrderCubit(),
            ),
            BlocProvider(
              create: (context) => ZalapiaCubit()
                ..fetchDocuments(category: Constant.zalapiaCategory),
            ),
          ],
          child: const HomeScreenView(),
        ),
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CartScreenCubit(),
            ),
          ],
          child: const CartScreenView(),
        ),
      ),
      GoRoute(
        path: boardScreen,
        builder: (context, state) => const OnBoardScreen(),
      ),
      GoRoute(
        path: splachScreen,
        builder: (context, state) => const SplashScreenView(),
      ),
      GoRoute(
        path: welcomeScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: receiptScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ReceiptCubit(),
          child: const ReceiptScreen(),
        ),
      )
    ],
  );
}
