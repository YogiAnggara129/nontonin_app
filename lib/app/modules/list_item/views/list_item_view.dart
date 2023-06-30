import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nontonin_app/app/data/interface/base_item_model.dart';

import '../../../components/item_tile_comp.dart';
import '../../../constants/colors.dart';
import '../controllers/list_item_controller.dart';

class ListItemView extends GetView<ListItemController> {
  const ListItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.listItemArg.title),
        backgroundColor: AppColors.primary,
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.snackbar('Pesan', 'Fitur belum tersedia'),
          )
        ],
      ),
      body: PagedListView<int, IBaseItemModel>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<IBaseItemModel>(
          itemBuilder: (context, item, index) => AppItemTileComp(item),
        ),
      ),
    );
  }
}
