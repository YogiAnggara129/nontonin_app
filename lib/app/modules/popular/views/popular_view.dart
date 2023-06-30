import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nontonin_app/app/components/item_tile_comp.dart';
import 'package:nontonin_app/app/components/rating_comp.dart';
import 'package:nontonin_app/app/data/models/movie_model.dart';
import 'package:nontonin_app/app/data/models/people_model.dart';
import 'package:nontonin_app/app/data/models/tv_model.dart';

import '../../../constants/colors.dart';
import '../controllers/popular_controller.dart';

class PopularView extends GetView<PopularController> {
  const PopularView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Populer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.snackbar('Pesan', 'Fitur belum tersedia'),
          )
        ],
        bottom: TabBar(
          controller: controller.tabController,
          unselectedLabelColor: AppColors.tertiary.withOpacity(0.5),
          labelColor: AppColors.quaternary,
          indicatorColor: AppColors.quaternary,
          tabs: controller.popularTabs,
        ),
      ),
      body: TabBarView(controller: controller.tabController, children: [
        PagedListView<int, MovieModel>(
          pagingController: controller.moviePagingController,
          builderDelegate: PagedChildBuilderDelegate<MovieModel>(
            itemBuilder: (context, item, index) => AppItemTileComp(item),
          ),
        ),
        PagedListView<int, TVModel>(
          pagingController: controller.tvPagingController,
          builderDelegate: PagedChildBuilderDelegate<TVModel>(
            itemBuilder: (context, item, index) => AppItemTileComp(item),
          ),
        ),
        PagedListView<int, PeopleModel>(
          pagingController: controller.peoplePagingController,
          builderDelegate: PagedChildBuilderDelegate<PeopleModel>(
            itemBuilder: (context, item, index) => AppItemTileComp(item),
          ),
        ),
      ]),
    );
  }
}
