import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/constants.dart';
import '../../../../../../common/widgets/top_bar.dart';
import '../../../../../../utilities/extensions/with_padding.dart';
import 'add_assignment_controller.dart';
import 'attachment_type.dart';

class AttachmentTypeBottomSheet extends GetView<AddAssignmentController> {
  const AttachmentTypeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SIZED_BOX_16,
          TopBar(
            title: "Choose type",
            isLeadingVisible: false,
            trailingIcon: Icons.close_rounded,
            trailingAction: Get.back,
          ),
          SIZED_BOX_16,
          Row(
            children: [
              AttachmentTypeButton(
                icon: Icons.image,
                label: "Image",
                onTap: controller.pickImage,
              ),
              AttachmentTypeButton(
                icon: Icons.video_camera_back,
                label: "Video",
                onTap: controller.pickVideo,
              ),
            ],
          ),
          Row(
            children: [
              AttachmentTypeButton(
                icon: Icons.file_present_sharp,
                label: "Document",
                onTap: controller.pickDocument,
              ),
              AttachmentTypeButton(
                icon: Icons.link,
                label: "Link",
                onTap: controller.pickLink,
              ),
            ],
          ),
        ].withSymmetricPadding(),
      ),
    );
  }
}
