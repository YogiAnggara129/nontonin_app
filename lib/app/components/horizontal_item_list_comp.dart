import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nontonin_app/app/components/rating_comp.dart';
import 'package:nontonin_app/app/data/interface/base_item_model.dart';
import 'package:nontonin_app/app/modules/list_item/controllers/list_item_controller.dart';
import 'package:nontonin_app/app/routes/app_pages.dart';

import '../constants/colors.dart';
import 'empty_data_comp.dart';

class AppHorizontalItemListComp extends StatelessWidget {
  const AppHorizontalItemListComp(
    this.titleSection,
    this.listItem, {
    super.key,
    this.onFetchMoreData,
    this.bgColor,
    this.titleSectionColor,
    this.cardColor,
    this.titleItemColor,
    this.dateItemColor,
  });

  final String titleSection;
  final List<IBaseItemModel> listItem;
  final Future<List<IBaseItemModel>?> Function(int pageKey)? onFetchMoreData;

  final Color? bgColor;
  final Color? titleSectionColor;
  final Color? cardColor;
  final Color? titleItemColor;
  final Color? dateItemColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleSection,
                style: TextStyle(
                    color: titleSectionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
              if (onFetchMoreData != null)
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.LIST_ITEM,
                        arguments: ListItemArg(titleSection, onFetchMoreData!));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.secondary),
                  child: const Text(
                    'Semua',
                    style: TextStyle(color: AppColors.tertiary),
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          listItem.isEmpty
              ? const AppEmptyDataComp()
              : SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemBuilder: (context, index) {
                      final item = listItem[index];
                      return Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  width: 80,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  imageUrl: item.getPosterUrl() ?? '',
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.tertiary,
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: AppRatingComp(
                                    (item.getRating() ?? 0).toDouble(),
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.getName() ?? '',
                              maxLines: 3,
                              style: const TextStyle(
                                color: AppColors.quaternary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.getDate() ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                color: AppColors.tertiary,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class HorizontalItemListType1Comp extends StatelessWidget {
  const HorizontalItemListType1Comp(
    this.titleSection,
    this.listItem, {
    super.key,
    this.onFetchMoreData,
  });

  final String titleSection;
  final List<IBaseItemModel> listItem;
  final Future<List<IBaseItemModel>?> Function(int pageKey)? onFetchMoreData;

  @override
  Widget build(BuildContext context) {
    return AppHorizontalItemListComp(
      titleSection,
      listItem,
      bgColor: AppColors.tertiary,
      titleSectionColor: AppColors.secondary,
      cardColor: AppColors.primary,
      titleItemColor: AppColors.quaternary,
      dateItemColor: AppColors.tertiary,
      onFetchMoreData: onFetchMoreData,
    );
  }
}

class HorizontalItemListType2Comp extends StatelessWidget {
  const HorizontalItemListType2Comp(
    this.titleSection,
    this.listItem, {
    super.key,
    this.onFetchMoreData,
  });

  final String titleSection;
  final List<IBaseItemModel> listItem;
  final Future<List<IBaseItemModel>?> Function(int pageKey)? onFetchMoreData;

  @override
  Widget build(BuildContext context) {
    return AppHorizontalItemListComp(
      titleSection,
      listItem,
      bgColor: AppColors.primary,
      titleSectionColor: AppColors.tertiary,
      cardColor: AppColors.secondary,
      titleItemColor: AppColors.quaternary,
      dateItemColor: AppColors.tertiary,
      onFetchMoreData: onFetchMoreData,
    );
  }
}
