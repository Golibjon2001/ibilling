import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/assets/images/images.dart';



class ContractAppBar extends StatefulWidget {
   ContractAppBar({Key? key,required this.text,required this.onPressedFilter,required this.onPressedSearch}) : super(key: key,);
  String text;
  VoidCallback? onPressedFilter;
  VoidCallback? onPressedSearch;


  @override
  State<ContractAppBar> createState() => _ContractAppBarState();
}

class _ContractAppBarState extends State<ContractAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(left:20,right:20,top: 14,),
      height:88,
      width:MediaQuery.of(context).size.width,
      color:darkets,
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Image(
                height:24,
                  width:24,
                  image:AssetImage(AppImages.image),
              ),
              const SizedBox(width:12,),
              Text(widget.text,style:const TextStyle(color:white,fontSize:20),),
            ],
          ),
          Row(
            children: [
             IconButton(
                 onPressed:widget.onPressedFilter,
                 icon:SvgPicture.asset(AppIcons.filter,color:white,),
             ),
              Container(height:18,width:1.5,color:white,),
              IconButton(
                onPressed:widget.onPressedSearch,
                icon:SvgPicture.asset(AppIcons.search,color:white,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
