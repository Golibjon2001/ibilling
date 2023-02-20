
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/create/pages/create_invoice.dart';
import 'package:ibilling/features/create/pages/create_screen.dart';
class CreateDialog extends StatefulWidget {
  const CreateDialog({Key? key}) : super(key: key);

  @override
  State<CreateDialog> createState() => _CreateDialogState();
}

class _CreateDialogState extends State<CreateDialog> {
  late int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:black,
      body:Center(
        child:AlertDialog(
          backgroundColor:dark,
          content:SizedBox(
            height:180,
            width:327,
            child: Column(
              children:[
                Text('str_what'.tr(),style:const TextStyle(color:white,fontSize:16,fontWeight:FontWeight.w700),),
                const SizedBox(height:28,),
                InkWell(
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateScreen(3)));
                  },
                  child: Container(
                    height:46,
                    width:287,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(4),
                      color:greydark.withOpacity(.4),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.paper,height:26,width:26,),
                          const SizedBox(width:15,),
                          Text("str_contracts".tr(),style:const TextStyle(color:white,fontWeight:FontWeight.w500),),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height:12,),
                InkWell(
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateInvoice()));
                  },
                  child: Container(
                    height:46,
                    width:287,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(4),
                      color:greydark.withOpacity(.4),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.invoice,height:26,width:26,),
                          const SizedBox(width:15,),
                          Text("str_invoice".tr(),style:const TextStyle(color:white,fontWeight:FontWeight.w500),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
