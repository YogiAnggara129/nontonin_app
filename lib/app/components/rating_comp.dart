import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppRatingComp extends StatelessWidget {
  const AppRatingComp(this.rate,
      {super.key, this.maxRate = 10, this.size = 30});

  final double rate;
  final double maxRate;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(size)),
      height: size,
      width: size,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                strokeWidth: 4/30 * size,
                color: AppColors.secondary,
                value: rate / maxRate,
              ),
            ),
          ),
          Center(
              child: Text(
            rate.toString(),
            style: TextStyle(
              color: AppColors.tertiary,
              fontWeight: FontWeight.w700,
              fontSize: 12 / 30 * size,
            ),
          )),
        ],
      ),
    );
  }
}
