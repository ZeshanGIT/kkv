import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kkv/model/class_model.dart';
import 'package:kkv/model/subject_card_theme.dart';

import '../../../model/assignment_model.dart';
import '../../../router/teacher_routes.dart';
import '../../../services/assignment_service.dart';

class ClassroomController extends GetxController
    with SingleGetTickerProviderMixin {
  final ClassModel classModel = Get.arguments;
  final SubjectCardTheme subjectCardTheme =
      SubjectCardTheme.fromSubject((Get.arguments as ClassModel).subject);

  final PagingController<int, AssignmentModel> pagingController =
      PagingController(firstPageKey: 0);

  late final TabController tabController;
  late final PageController pageController;
  static const _pageSize = 5;
  static const FEED = "Feed";
  static const ASSIGNMENT = "Assignment";

  String? fabLabel = FEED;

  @override
  onInit() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      pageController.animateToPage(
        tabController.index,
        duration: 500.milliseconds,
        curve: Curves.easeInOut,
      );
      if (tabController.index == 2) {
        fabLabel = null;
      } else {
        fabLabel = tabController.index == 0 ? FEED : ASSIGNMENT;
      }
      update();
    });

    pageController = PageController();
    pageController.addListener(() {
      tabController.animateTo(pageController.page!.round());
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
