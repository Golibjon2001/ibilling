import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
class CreatInfo extends StatefulWidget {
  CreatInfo({Key? key,required this.text,required this.itms}) : super(key: key);
  String text;
  List<String> itms;
  @override
  State<CreatInfo> createState() => _CreatInfoState();
}

class _CreatInfoState extends State<CreatInfo> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text(widget.text,style:TextStyle(color:greylight.withOpacity(0.4)),),
        const SizedBox(height:6,),
        Container(
          height:44,
          width:MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            border:Border.all(color:greylight.withOpacity(0.4)),
            borderRadius:BorderRadius.circular(4),
          ),
          child:Padding(
            padding: const EdgeInsets.only(left:10,right:10),
            child:DropdownButtonHideUnderline(
              child: DropdownButton(
                value:value,
                isExpanded:true,
                dropdownColor:dark,
                icon:SvgPicture.asset(AppIcons.circle,color:greylight.withOpacity(0.4),),
                items:widget.itms.map(buildMenueItem).toList(),
                onChanged:(value)=>setState(()=>this.value=value),
              ),
            ),
          ),
        ),
      ],
    );;
  }
  DropdownMenuItem<String> buildMenueItem(String item)=>DropdownMenuItem(
      value:item,
      child: Text(item,style:const TextStyle(fontSize:20,color:white),),
  );
}
