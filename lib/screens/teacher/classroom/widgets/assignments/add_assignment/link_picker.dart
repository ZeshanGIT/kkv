import 'package:after_layout/after_layout.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/common/text_styles.dart';

class LinkPicker extends StatefulWidget {
  const LinkPicker({Key? key}) : super(key: key);

  @override
  _LinkPickerState createState() => _LinkPickerState();
}

class _LinkPickerState extends State<LinkPicker> with AfterLayoutMixin {
  bool isURL = false;
  String clipContent = "";
  TextEditingController linkController = TextEditingController();

  keepChecking() async {
    String tempClipContent = await FlutterClipboard.paste();
    bool tempIsURL = GetUtils.isURL(tempClipContent);
    print("Checking");
    print("$tempClipContent - $tempIsURL");
    if (tempIsURL) {
      setState(() {
        clipContent = tempClipContent;
        isURL = tempIsURL;
      });
      return;
    }
    Future.delayed(1.seconds, keepChecking);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Paste link here"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isURL) ...[
            TextButton(
              onPressed: () => linkController.text = clipContent,
              child: Text("Paste from clipboard"),
            ),
            Text(
              clipContent,
              style: SMALL_SUB_HEADING,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ).paddingOnly(left: 8)
          ],
          SIZED_BOX_16,
          TextFormField(
            controller: linkController,
            autocorrect: false,
            validator: (link) =>
                GetUtils.isURL(link ?? '') ? null : "Invalid URL",
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "Link",
              labelText: "Link",
            ),
          ),
          SIZED_BOX_16,
          Container(
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: Text(
                "Submit",
                style: SUB_HEADING,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    keepChecking();
  }
}
