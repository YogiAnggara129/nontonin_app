import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/watch_list_controller.dart';

class WatchListView extends GetView<WatchListController> {
  const WatchListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WatchListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WatchListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
