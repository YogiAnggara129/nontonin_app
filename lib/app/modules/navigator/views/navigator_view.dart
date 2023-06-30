import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nontonin_app/app/constants/colors.dart';
import 'package:nontonin_app/app/modules/movie/views/movie_view.dart';
import 'package:nontonin_app/app/modules/popular/views/popular_view.dart';
import 'package:nontonin_app/app/modules/tv/views/tv_view.dart';

import '../controllers/navigator_controller.dart';

class NavigatorView extends GetView<NavigatorController> {
  const NavigatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle unselectedLabelStyle = TextStyle(
        color: AppColors.tertiary.withOpacity(0.5),
        fontWeight: FontWeight.w500,
        fontSize: 12);

    const TextStyle selectedLabelStyle = TextStyle(
        color: AppColors.quaternary, fontWeight: FontWeight.w500, fontSize: 12);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            backgroundColor: AppColors.primary,
            unselectedItemColor: AppColors.tertiary.withOpacity(0.5),
            selectedItemColor: AppColors.quaternary,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: const [
              BottomNavigationBarItem(
                label: 'Movie',
                icon: Icon(Icons.movie),
                backgroundColor: AppColors.primary,
              ),
              BottomNavigationBarItem(
                label: 'TV',
                icon: Icon(Icons.tv),
                backgroundColor: AppColors.primary,
              ),
              BottomNavigationBarItem(
                label: 'Populer',
                icon: Icon(Icons.star),
                backgroundColor: AppColors.primary,
              ),
            ],
          ),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: const [
              MovieView(),
              TvView(),
              PopularView(),
            ],
          ),
        ),
      ),
    );
  }
}
