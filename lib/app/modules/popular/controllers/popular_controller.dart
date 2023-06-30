import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nontonin_app/app/data/models/movie_model.dart';
import 'package:nontonin_app/app/data/models/people_model.dart';
import 'package:nontonin_app/app/data/models/tv_model.dart';
import 'package:nontonin_app/app/data/providers/movie_provider.dart';
import 'package:nontonin_app/app/data/providers/people_provider.dart';
import 'package:nontonin_app/app/data/providers/tv_provider.dart';

class PopularController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PopularController(this.movieProvider, this.tvProvider, this.peopleProvider);

  final MovieProvider movieProvider;
  final TVProvider tvProvider;
  final PeopleProvider peopleProvider;

  late final TabController tabController;
  final List<Tab> popularTabs = const <Tab>[
    Tab(icon: Icon(Icons.movie)),
    Tab(icon: Icon(Icons.tv)),
    Tab(icon: Icon(Icons.person)),
  ];

  final PagingController<int, MovieModel> moviePagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, TVModel> tvPagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, PeopleModel> peoplePagingController =
      PagingController(firstPageKey: 1);

  Future<void> getMovie({int page = 1}) async {
    try {
      final res = await movieProvider.getPopular(page: page);
      final isLastPage =
          (moviePagingController.itemList?.length ?? 0) / (page - 1) >
              (res?.length ?? 0);
      if (isLastPage) {
        moviePagingController.appendLastPage(res ?? []);
      } else {
        final nextPageKey = page + 1;
        moviePagingController.appendPage(res ?? [], nextPageKey);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> getTv({int page = 1}) async {
    try {
      final res = await tvProvider.getPopular(page: page);
      final isLastPage =
          (tvPagingController.itemList?.length ?? 0) / (page - 1) >
              (res?.length ?? 0);
      if (isLastPage) {
        tvPagingController.appendLastPage(res ?? []);
      } else {
        final nextPageKey = page + 1;
        tvPagingController.appendPage(res ?? [], nextPageKey);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> getPerson({int page = 1}) async {
    try {
      final res = await peopleProvider.getPopular(page: page);
      final isLastPage =
          (peoplePagingController.itemList?.length ?? 0) / (page - 1) >
              (res?.length ?? 0);
      if (isLastPage) {
        peoplePagingController.appendLastPage(res ?? []);
      } else {
        final nextPageKey = page + 1;
        peoplePagingController.appendPage(res ?? [], nextPageKey);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: popularTabs.length, vsync: this);
    moviePagingController.addPageRequestListener((pageKey) {
      getMovie(page: pageKey);
    });
    tvPagingController.addPageRequestListener((pageKey) {
      getTv(page: pageKey);
    });
    peoplePagingController.addPageRequestListener((pageKey) {
      getPerson(page: pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    moviePagingController.dispose();
    tvPagingController.dispose();
    peoplePagingController.dispose();
    super.onClose();
  }
}
