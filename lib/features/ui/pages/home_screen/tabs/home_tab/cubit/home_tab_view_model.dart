import 'package:e_commerce_app/core/exceptions/app_exceptions.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_sates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabSates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel({required this.getAllCategoriesUseCase, required this.getAllBrandsUseCase})
    : super(HomeTabInitial());

    HomeTabSuccessState homeTabSuccessState = HomeTabSuccessState();
  // hold data - handle logic - emit state
  List<String> imagesList = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];

  Future<void> getAllCategories() async {
    try {
      emit(CategoryLoadingState());
      var categoriesList = await getAllCategoriesUseCase.invoke();
      emit(homeTabSuccessState = homeTabSuccessState.copyWith(categoriesList: categoriesList ?? []));
    } on AppExceptions catch (e) {
      emit(CategoryErrorState(message: e.message));
    }
  }

  Future<void> getAllBrands() async {
    try {
      emit(BrandLoadingState());
      var brandsList = await getAllBrandsUseCase.invoke();
      emit(homeTabSuccessState = homeTabSuccessState.copyWith(brandList: brandsList ?? []));
    } on AppExceptions catch (e) {
      emit(BrandErrorState(message: e.message));
    }
  }
}
