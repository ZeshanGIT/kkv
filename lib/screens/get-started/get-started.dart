import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkv/assets/get-started.dart';
import 'package:kkv/common/constants.dart';

class GetStarted extends StatelessWidget {
  final getStartedImageStye = ParentStyle(angleFormat: AngleFormat.degree)
    ..boxShadow(
      blur: 20,
      offset: const Offset(0, 6),
      color: Color(0x5281A2).withOpacity(0.2),
    );

  GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.maxFinite),
          Parent(
            style: getStartedImageStye,
            child: ClipRRect(
              borderRadius: BORDER_RADIUS_LARGE,
              child: SvgPicture.asset(GetStartedAssets.getStartedImg),
            ),
          ),
        ],
      ),
    );
  }
}
