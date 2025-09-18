import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(viewModel.selectedIndex),
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
            child: viewModel.bodyList[viewModel.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: viewModel.selectedIndex,
                onTap: viewModel.bottomNavOnTab,
                iconSize: 24.sp,
                items: [
                  _bottomNavigationItemBuilder(
                    isSelected: viewModel.selectedIndex == 0,
                    selectedIcon: AppAssets.selectedHomeIcon,
                    unSelectedIcon: AppAssets.unSelectedHomeIcon,
                  ),
                  _bottomNavigationItemBuilder(
                    isSelected: viewModel.selectedIndex == 1,
                    selectedIcon: AppAssets.selectedProductIcon,
                    unSelectedIcon: AppAssets.unSelectedProductIcon,
                  ),
                  _bottomNavigationItemBuilder(
                    isSelected: viewModel.selectedIndex == 2,
                    selectedIcon: AppAssets.selectedFavoriteIcon,
                    unSelectedIcon: AppAssets.unSelectedFavoriteIcon,
                  ),
                  _bottomNavigationItemBuilder(
                    isSelected: viewModel.selectedIndex == 3,
                    selectedIcon: AppAssets.selectedProfileIcon,
                    unSelectedIcon: AppAssets.unSelectedProfileIcon,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget? _buildAppBar(int selectedIndex) {}

  BottomNavigationBarItem _bottomNavigationItemBuilder({
    required bool isSelected,
    required String selectedIcon,
    required String unSelectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor: isSelected
            ? AppColors.primaryColor
            : AppColors.whiteColor,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        radius: 20.r,
        child: ImageIcon(
          AssetImage(isSelected ? selectedIcon : unSelectedIcon),
        ),
      ),
      label: "",
    );
  }
}
