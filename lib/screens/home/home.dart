import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kkv/assets/home.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/common/widgets/subject_card.dart';
import 'package:kkv/common/widgets/top_bar.dart';
import 'package:kkv/screens/home/home_controller.dart';
import 'package:kkv/services/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                leftIconButton: IconButton(
                  onPressed: () {},
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
