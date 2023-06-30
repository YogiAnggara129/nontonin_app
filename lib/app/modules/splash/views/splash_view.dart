import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nontonin_app/app/constants/colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.start();
    return Scaffold(
      backgroundColor: AppColors.tertiary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.movie,
              size: 50,
              color: AppColors.secondary,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'NontoninAja App',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
