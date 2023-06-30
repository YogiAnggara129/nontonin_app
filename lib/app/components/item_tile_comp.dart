import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nontonin_app/app/components/rating_comp.dart';
import 'package:nontonin_app/app/data/interface/base_item_model.dart';

import '../constants/colors.dart';

class AppItemTileComp extends StatelessWidget {
  const AppItemTileComp(this.item, {super.key});

  final IBaseItemModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          width: 50,
          fit: BoxFit.cover,
          imageUrl: item.getPosterUrl() ?? '',
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              color: AppColors.secondary,
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      title: Text(
        item.getName() ?? '',
        style: const TextStyle(
            fontWeight: FontWeight.w700, color: AppColors.secondary),
      ),
      subtitle: Text(
        item.getDate() ?? '',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primary.withOpacity(0.7)),
      ),
      trailing: item.getRating() != null
          ? AppRatingComp((item.getRating() ?? 0).toDouble())
          : null,
    );
  }
}
