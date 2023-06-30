// ignore_for_file: prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:nontonin_app/app/components/empty_data_comp.dart';
import 'package:nontonin_app/app/components/horizontal_item_list_comp.dart';
import 'package:nontonin_app/app/constants/colors.dart';

import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  const MovieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Film'),
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
                        controller.movieProvider.getTopRated(page: pageKey),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.listNowPlaying.length >= 0,
                  child: HorizontalItemListType2Comp(
                    'Sedang Diputar',
                    controller.listNowPlaying,
                    onFetchMoreData: (pageKey) =>
                        controller.movieProvider.getNowPlaying(page: pageKey),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.listUpcoming.length >= 0,
                  child: HorizontalItemListType1Comp(
                    'Film Mendatang',
                    controller.listUpcoming,
                    onFetchMoreData: (pageKey) =>
                        controller.movieProvider.getUpcoming(page: pageKey),
                  ),
                ),
              ),
            ],
            // children: [
            //   Container(
            //     padding: EdgeInsets.all(12),
            //     color: AppColors.tertiary,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Top Rating',
            //           style: TextStyle(
            //               color: AppColors.secondary,
            //               fontSize: 24,
            //               fontWeight: FontWeight.w800),
            //         ),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         Obx(
            //           () => controller.listTopRated.isEmpty
            //               ? const AppEmptyDataComp()
            //               : SizedBox(
            //                   height: 220,
            //                   child: ListView.separated(
            //                     scrollDirection: Axis.horizontal,
            //                     shrinkWrap: true,
            //                     itemCount: 5,
            //                     separatorBuilder: (context, index) =>
            //                         SizedBox(
            //                       width: 20,
            //                     ),
            //                     itemBuilder: (context, index) {
            //                       final movie =
            //                           controller.listTopRated[index];
            //                       return Container(
            //                         width: 100,
            //                         padding: EdgeInsets.all(10),
            //                         decoration: BoxDecoration(
            //                             color: AppColors.primary,
            //                             borderRadius:
            //                                 BorderRadius.circular(5)),
            //                         child: Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CachedNetworkImage(
            //                               width: 80,
            //                               height: 120,
            //                               fit: BoxFit.cover,
            //                               imageUrl:
            //                                   '${dotenv.env["ASSET_BASE_URL"]}/${movie.posterPath ?? ''}',
            //                               progressIndicatorBuilder: (context,
            //                                       url, downloadProgress) =>
            //                                   CircularProgressIndicator(
            //                                       value: downloadProgress
            //                                           .progress),
            //                               errorWidget:
            //                                   (context, url, error) =>
            //                                       Icon(Icons.error),
            //                             ),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                             Text(
            //                               movie.title ?? '',
            //                               maxLines: 3,
            //                               style: TextStyle(
            //                                 color: AppColors.quaternary,
            //                                 fontSize: 14,
            //                                 fontWeight: FontWeight.bold,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               height: 5,
            //                             ),
            //                             Text(
            //                               movie.releaseDate ?? '',
            //                               maxLines: 2,
            //                               style: TextStyle(
            //                                 color: AppColors.tertiary,
            //                                 fontWeight: FontWeight.w500,
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       );
            //                     },
            //                   ),
            //                 ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   SizedBox(
            //     height: 10,
            //   ),
            //   Container(
            //     padding: EdgeInsets.all(12),
            //     color: AppColors.primary,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Film Mendatang',
            //           style: TextStyle(
            //               color: AppColors.tertiary,
            //               fontSize: 24,
            //               fontWeight: FontWeight.w800),
            //         ),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         Obx(
            //           () => controller.listTopRated.isEmpty
            //               ? const AppEmptyDataComp()
            //               : SizedBox(
            //                   height: 220,
            //                   child: ListView.separated(
            //                     scrollDirection: Axis.horizontal,
            //                     shrinkWrap: true,
            //                     itemCount: 5,
            //                     separatorBuilder: (context, index) =>
            //                         SizedBox(
            //                       width: 20,
            //                     ),
            //                     itemBuilder: (context, index) {
            //                       final movie =
            //                           controller.listTopRated[index];
            //                       return Container(
            //                         width: 100,
            //                         padding: EdgeInsets.all(10),
            //                         decoration: BoxDecoration(
            //                             color: AppColors.secondary,
            //                             borderRadius:
            //                                 BorderRadius.circular(5)),
            //                         child: Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             CachedNetworkImage(
            //                               width: 80,
            //                               height: 120,
            //                               fit: BoxFit.cover,
            //                               imageUrl:
            //                                   '${dotenv.env["ASSET_BASE_URL"]}/${movie.posterPath ?? ''}',
            //                               progressIndicatorBuilder: (context,
            //                                       url, downloadProgress) =>
            //                                   CircularProgressIndicator(
            //                                       value: downloadProgress
            //                                           .progress),
            //                               errorWidget:
            //                                   (context, url, error) =>
            //                                       Icon(Icons.error),
            //                             ),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                             Text(
            //                               movie.title ?? '',
            //                               maxLines: 3,
            //                               style: TextStyle(
            //                                 color: AppColors.quaternary,
            //                                 fontSize: 14,
            //                                 fontWeight: FontWeight.bold,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               height: 5,
            //                             ),
            //                             Text(
            //                               movie.releaseDate ?? '',
            //                               maxLines: 2,
            //                               style: TextStyle(
            //                                 color: AppColors.tertiary,
            //                                 fontWeight: FontWeight.w500,
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       );
            //                     },
            //                   ),
            //                 ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],
          ),
        ),
      ),
    );
  }
}
