import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/bloc_observer.dart';
import 'core/helper/shared_preferences.dart';
import 'core/utils/app_routs.dart';
import 'core/utils/constanent.dart';
import 'features/cart/data/model/cart_model/cart_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>(Constant.orderBox);

  runApp(const StarGo());
}

class StarGo extends StatelessWidget {
  const StarGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      
      routerConfig: AppRouter.router,
      
    );
  }
}
