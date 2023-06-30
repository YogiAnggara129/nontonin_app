import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/interface/base_item_model.dart';

class ListItemController extends GetxController {
  final PagingController<int, IBaseItemModel> pagingController =
      PagingController(firstPageKey: 1);
  late final ListItemArg listItemArg;

  Future<void> fetchData(int page) async {
    try {
      final res = await listItemArg.onFetchMoreData(page);
      final isLastPage = (pagingController.itemList?.length ?? 0) / (page - 1) >
          (res?.length ?? 0);
      if (isLastPage) {
        pagingController.appendLastPage(res ?? []);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(res ?? [], nextPageKey);
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  @override
  void onInit() {
    listItemArg = Get.arguments;
    pagingController.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}

class ListItemArg {
  String title;
  final Future<List<IBaseItemModel>?> Function(int pageKey) onFetchMoreData;

  ListItemArg(this.title, this.onFetchMoreData);
}
