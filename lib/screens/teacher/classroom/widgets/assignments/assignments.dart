import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../model/assignment_model.dart';
import '../../classroom_controller.dart';
import 'assignment_card.dart';

class Assignment extends StatelessWidget {
  Assignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassroomController>(
      builder: (classRoomController) => PagedListView(
        physics: BouncingScrollPhysics(),
        pagingController: classRoomController.pagingController,
        builderDelegate: PagedChildBuilderDelegate<AssignmentModel>(
            noItemsFoundIndicatorBuilder: (_) => Center(
                  child: Text("No assignments found"),
                ),
            newPageProgressIndicatorBuilder: (_) => CircularProgressIndicator(),
            itemBuilder: (_, item, index) {
              return AssignmentCard(item);
            }),
      ),
    );
  }
}
