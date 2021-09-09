import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../model/assignment_model.dart';
import '../../../router/teacher_routes.dart';
import '../../../services/assignment_service.dart';

class ClassroomController extends GetxController
    with SingleGetTickerProviderMixin {
  final PagingController<int, AssignmentModel> pagingController =
      PagingController(firstPageKey: 0);

  late final TabController tabController;
  static const _pageSize = 5;
  static const FEED = "Feed";
  static const ASSIGNMENT = "Assignment";

  String? fabLabel = FEED;

  @override
  onInit() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.index == 2) {
        fabLabel = null;
      } else {
        fabLabel = tabController.index == 0 ? FEED : ASSIGNMENT;
      }
      update();
    });
    super.onInit();
  }

  @override
  void onReady() {
    pagingController.addPageRequestListener((pageKey) {
      print("Fetching -- $pageKey");
      _fetchPage(pageKey);
    });
    super.onReady();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await AssignmentService().fetchMore(_pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
      print(error);
    }
  }

  void createNew() {
    if (fabLabel == FEED)
      return;
    else if (fabLabel == ASSIGNMENT) Get.toNamed(TeacherRoutes.ADD_ASSIGNMENT);
  }
}
