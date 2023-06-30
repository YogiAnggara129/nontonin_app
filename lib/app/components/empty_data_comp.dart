import 'package:flutter/material.dart';
import 'package:nontonin_app/app/constants/colors.dart';

class AppEmptyDataComp extends StatelessWidget {
  const AppEmptyDataComp({super.key, this.message = 'Data Kosong'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.file_copy_outlined,
            color: AppColors.primary,
            size: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary),
          )
        ],
      ),
    );
  }
}
