// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/horizontal_item_list_comp.dart';
import '../../../constants/colors.dart';
import '../controllers/tv_controller.dart';

class TvView extends GetView<TvController> {
  const TvView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('TV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.snackbar('Pesan', 'Fitur belum tersedia'),
          )
        ],
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async => controller.onInit(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Visibility(
                  visible: controller.listTopRated.length >= 0,
                  child: HorizontalItemListType1Comp(
                    'Top Rating',
                    controller.listTopRated,
                    onFetchMoreData: (pageKey) =>
                        controller.tvProvider.getTopRated(page: pageKey),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.listOnTheAir.length >= 0,
                  child: HorizontalItemListType2Comp(
                    'Disiarkan',
                    controller.listOnTheAir,
                    onFetchMoreData: (pageKey) =>
                        controller.tvProvider.getOnTheAir(page: pageKey),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.listAiringToday.length >= 0,
                  child: HorizontalItemListType1Comp(
                    'Tayang Hari Ini',
                    controller.listAiringToday,
                    onFetchMoreData: (pageKey) =>
                        controller.tvProvider.getAiringToday(page: pageKey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
