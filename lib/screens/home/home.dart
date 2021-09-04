import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kkv/assets/common_asset.dart';
import 'package:kkv/assets/home.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/common/widgets/subject_card.dart';
import 'package:kkv/common/widgets/top_bar.dart';
import 'package:kkv/screens/home/home_controller.dart';
import 'package:simple_animations/simple_animations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AnimationMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Scaffold(
        key: homeController.scaffoldKey,
        drawer: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Container(
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 256,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        homeController.user!.profilePic,
                        height: 64,
                      ),
                    ),
                    SIZED_BOX_16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          homeController.user!.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "59305",
                          style: TextStyle(
                            color: Color(0xFF4B4F79),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SIZED_BOX_64,
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.military_tech_rounded),
                      SIZED_BOX_16,
                      Text("Achievements"),
                    ],
                  ),
                ),
                SIZED_BOX_32,
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.celebration_rounded),
                      SIZED_BOX_16,
                      Text("Rewards"),
                    ],
                  ),
                ),
                Spacer(),
                SvgPicture.asset(CommonAsset.DRAWER_BOTTOM_ILLUS),
              ],
            ).paddingAll(24),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                leftIconButton: IconButton(
                  onPressed: () => homeController.openDrawer(),
                  icon: Icon(Icons.graphic_eq),
                ),
                rightIconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_rounded),
                ),
              ),
              SIZED_BOX_24,
              Text(
                "Hi, ${homeController.user?.name}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingAll(16),
              SubjectCard(
                title: "Mathematics",
                darkColor: Color(0xFF4F2A74),
                lightColor: Color(0xFFEDCFEA),
                imgPath: HomeAssets.Cat,
                onTap: () {},
              ),
              SubjectCard(
                title: "Social",
                darkColor: Color(0xFFF48021),
                lightColor: Color(0xFFFBDBA9),
                imgPath: HomeAssets.Cat,
                onTap: () {},
              ),
              SubjectCard(
                title: "Mathematics",
                darkColor: Color(0xFF4F2A74),
                lightColor: Color(0xFFEDCFEA),
                imgPath: HomeAssets.Cat,
                onTap: () {},
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
