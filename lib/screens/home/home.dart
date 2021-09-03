import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkv/assets/home.dart';
import 'package:kkv/common/widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TopBar(
              leftIconButton: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(HomeAssets.MenuIcon),
              ),
              rightIconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
