import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../common/text_styles.dart';
import '../../../../../../model/attachment_model.dart';
import 'add_assignment_controller.dart';

class AttachmentCard extends StatelessWidget {
  final AttachmentModel attachmentModel;
  AttachmentCard(this.attachmentModel, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return GetBuilder<AddAssignmentController>(
      builder: (controller) => Card(
        child: Slidable(
          closeOnScroll: true,
          actionPane: SlidableBehindActionPane(),
          key: Key(attachmentModel.url ??
              attachmentModel.file?.path ??
              (attachmentModel.title + attachmentModel.type)),
          actionExtentRatio: 0.25,
          actions: [
            IconSlideAction(
              caption: "Delete",
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => controller.removeAttachment(attachmentModel),
            )
          ],
          secondaryActions: [
            IconSlideAction(
              caption: "Delete",
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => controller.removeAttachment(attachmentModel),
            )
          ],
          child: GestureDetector(
            onTap: () {
              if (attachmentModel.type == AttachmentModel.LINK &&
                  attachmentModel.url != null) {
                print("Launching URL");
                launch(attachmentModel.url!);
              } else
                OpenFile.open(
                    attachmentModel.url ?? attachmentModel.file?.path);
            },
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      // child: Transform.translate(
                      //   offset: Offset(16, 16),
                      child: Transform.rotate(
                        angle: 15 * 0.01745,
                        child: Icon(
                          iconFromString(attachmentModel.type),
                          color: Colors.black12,
                          size: 64,
                        ),
                      ),
                      // ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            attachmentModel.type,
                            style: SMALL_SUB_HEADING,
                          ),
                          SizedBox(
                            width: Get.width - 72,
                            child: Text(
                              attachmentModel.title,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ).paddingAll(16),
                      // if (attachmentModel.type == AttachmentModel.IMAGE &&
                      //     attachmentModel.file?.path != null)
                      //   Image.file(
                      //     File(attachmentModel.file!.path),
                      //     height: 72,
                      //     fit: BoxFit.cover,
                      //   ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData iconFromString(String type) {
    switch (type) {
      case AttachmentModel.LINK:
        return Icons.link;
      case AttachmentModel.IMAGE:
        return Icons.image;
      case AttachmentModel.VIDEO:
        return Icons.slow_motion_video_rounded;
      case AttachmentModel.DOCUMENT:
        return Icons.file_present_sharp;
      default:
        return Icons.link;
    }
  }
}
