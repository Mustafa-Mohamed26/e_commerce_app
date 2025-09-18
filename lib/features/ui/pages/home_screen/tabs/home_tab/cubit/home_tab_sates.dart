import 'package:e_commerce_app/domain/entities/response/category.dart';

sealed class HomeTabSates {}

class HomeTabInitial extends HomeTabSates {}

class CategoryLoadingState extends HomeTabSates {}

class CategoryErrorState extends HomeTabSates {
  String message;
  CategoryErrorState({required this.message});
}

class CategorySuccessState extends HomeTabSates {
  List<Category> categoriesList;
  CategorySuccessState({required this.categoriesList});
}

class BrandLoadingState extends HomeTabSates {}

class BrandErrorState extends HomeTabSates {
  String message;
  BrandErrorState({required this.message});
}

class BrandSuccessState extends HomeTabSates {
  List<Category> brandList;
  BrandSuccessState({required this.brandList});
}

class HomeTabSuccessState extends HomeTabSates {
  List<Category>? categoriesList;
  List<Category>? brandList;

  HomeTabSuccessState({ this.categoriesList,  this.brandList});

  HomeTabSuccessState copyWith({
    List<Category>? categoriesList,
    List<Category>? brandList,
  }) {
    return HomeTabSuccessState(
      categoriesList: categoriesList ?? this.categoriesList,
      brandList: brandList ?? this.brandList,
    );
  }
}
