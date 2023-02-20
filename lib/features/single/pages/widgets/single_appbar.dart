import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
class SingleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SingleAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkets,
        title: Row(
          children: [
            SvgPicture.asset(
              AppIcons.paper,
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "№ 153",
              style: TextStyle(color: white),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(
            AppIcons.booc,
            color: white,
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(51);
}
