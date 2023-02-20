import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';


class CreateInfoown extends StatefulWidget {
  CreateInfoown({Key? key,required this.text,required this.icon,required this.controller}) : super(key: key);
  String text;
  IconData? icon;
  TextEditingController? controller;
  @override
  State<CreateInfoown> createState() => _CreateInfoownState();
}

class _CreateInfoownState extends State<CreateInfoown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text(widget.text,style:TextStyle(color:greylight.withOpacity(0.4))),
        const SizedBox(height:6,),
        Container(
          width:MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            border:Border.all(color:greylight.withOpacity(0.4)),
            borderRadius:BorderRadius.circular(4),),
          child:Padding(
            padding:const EdgeInsets.only(left:16,),
            child: TextField(
              controller:widget.controller,
              maxLines:null,
              style:const TextStyle(color:white),
              cursorColor:white,
              decoration:InputDecoration(
                  suffixIcon:Icon(widget.icon,color:greylight.withOpacity(0.4),),
                  hintStyle:const TextStyle(color:grey),
                  border:InputBorder.none
              ),
            ),
          ),
        ),
      ],
    );
  }
}

