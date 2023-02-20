
import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/images/images.dart';
class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String text;
  const ProfileAppbar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        automaticallyImplyLeading:false,
        backgroundColor:darkets,
        title:Row(
          children:[
            const Image(
              height:24,
              width:24,
              image:AssetImage(AppImages.image),
            ),
            const SizedBox(width:12,),
            Text(text,style:const TextStyle(color:white,fontSize:20),),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(51);
}
