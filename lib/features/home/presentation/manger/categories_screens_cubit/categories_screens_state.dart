part of 'categories_screens_cubit.dart';

abstract class CategoriesScreensState extends Equatable {
  const CategoriesScreensState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesScreensState {}

class ReadCartLength extends CategoriesScreensState {}

class NoCartItems extends CategoriesScreensState {}

class CartLength extends CategoriesScreensState {}
