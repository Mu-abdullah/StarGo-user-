import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/features/home/presentation/views/widgets/screens/zalapia.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/texts.dart';
import '../../views/widgets/screens/pizza.dart';
import '../../views/widgets/screens/cripe.dart';
import '../../views/widgets/screens/pasta.dart';
import '../../views/widgets/screens/salt_pan.dart';
import '../../views/widgets/screens/sweet_pan.dart';

part 'categories_screens_state.dart';

class CategoriesScreensCubit extends Cubit<CategoriesScreensState> {
  CategoriesScreensCubit() : super(CategoriesInitial());
  static CategoriesScreensCubit get(context) => BlocProvider.of(context);
  List<Widget> topTabs = const [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: TitleTexts(
        text: "بيتزا",
        fontFamily: AssetDate.messiriFont,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: TitleTexts(
        text: "كريب",
        fontFamily: AssetDate.messiriFont,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: TitleTexts(
        text: "مكرونات",
        fontFamily: AssetDate.messiriFont,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: TitleTexts(
        text: "فطائر حلو",
        fontFamily: AssetDate.messiriFont,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: TitleTexts(
        text: "فطائر حادق",
        fontFamily: AssetDate.messiriFont,
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: TitleTexts(
        text: "زلابيا",
        fontFamily: AssetDate.messiriFont,
      ),
    ),
  ];

  List<Widget> categoryScreen = const [
    PizzaScreen(),
    CripeScreen(),
    PastaScreen(),
    SweetPanCake(),
    SaltPanCake(),
    Zalapia(),
  ];
}
