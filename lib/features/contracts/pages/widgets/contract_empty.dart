import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/assets/colors/colors.dart';


class ContractEmpty extends StatelessWidget {
  const ContractEmpty({Key? key,required this.text,required this.icon,}) : super(key: key);
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon,color:darker,),
          const SizedBox(height:8,),
          Text(text,style:const TextStyle(color:darker),)
        ],
      ),
    );
  }
}
