import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kkv/assets/MyAssets.dart';

import '../constants.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.darkColor,
    required this.lightColor,
    required this.onTap,
  }) : super(key: key);

  final String imgPath;
  final String title;
  final Color darkColor;
  final Color lightColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: (Color.lerp(darkColor, lightColor, 0.9) ?? lightColor)
                      .withOpacity(0.5),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                )
              ],
              borderRadius: BORDER_RADIUS_MEDIUM,
              color: lightColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  imgPath,
                  height: 96,
                ),
                SIZED_BOX_16,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "IV - A",
                      style: TextStyle(
                        color: darkColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingAll(24),
          ).paddingAll(16),
          Positioned(
            bottom: 16,
            right: 16,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                darkColor,
                BlendMode.srcATop,
              ),
              child: SvgPicture.asset(MyAssets.SubjectCardCircle),
            ),
          ),
        ],
      ),
    );
  }
}
