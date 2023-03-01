import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/data/models/contract_model.dart';
import 'package:ibilling/features/contracts/pages/contracts_filters.dart';
import 'package:ibilling/features/contracts/pages/contracts_search.dart';
import 'package:ibilling/features/contracts/pages/widgets/contarct_app_bar.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_empty.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_item.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<ContractModel> items = [
    ContractModel(date: DateTime.now(),name:"Ziyoda", id:1, salary:"1200 USD", number:26, invoise:"3",color:lightgreen, text: 'Paid'),
    ContractModel(date: DateTime.now(),name:"Ilxom", id:1, salary:"1200 USD", number:26, invoise:"3", color:orange, text: 'In process'),
    ContractModel(date: DateTime.now(),name:"Joni", id:1, salary:"1200 USD", number:26, invoise:"3", color:read, text: 'Rejected by Payme'),
    ContractModel(date: DateTime.now(),name:"Alexs", id:1, salary:"1200 USD", number:26, invoise:"3", color:lightgreen, text: 'Rejected by IQ'),
    ContractModel(date: DateTime.now(),name:"Ozod", id:1, salary:"1200 USD", number:26, invoise:"3",color:orange, text: 'In process'),
  ];
  bool empty=true;
  String? selectedData;
  String? selectedDatatwo;
  void _selectDateone(){
    showDatePicker(
        context: context,
        initialDate:DateTime.now(),
        firstDate:DateTime(2022),
        lastDate:DateTime.now()
    ).then((piscedDate)  {
      if(piscedDate==null){return;}
      selectedData=Jiffy(piscedDate).format('dd.MM.yyyy')/*DateFormat.yMd().format(piscedDate)*/;
      setState(() {

      });
    });
  }
  void _selectDatetwo(){
    showDatePicker(
        context: context,
        initialDate:DateTime.now(),
        firstDate:DateTime(2022),
        lastDate:DateTime.now()
    ).then((piscedDate)  {
      if(piscedDate==null){return;}
      selectedDatatwo=Jiffy(piscedDate).format('dd.MM.yyyy')/*DateFormat.yMd().format(piscedDate)*/;
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:black,
      body:Column(
        children: [
          ContractAppBar(text: "str_history".tr(),
            onPressedFilter: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContractsFilter()),
              );
            },
            onPressedSearch: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContractsSearch()),
              );
            },
          ),
          Expanded(
              child:empty?SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left:20,right:20,top:20),
                  child: Column(
                   crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text("str_date".tr(),style:const TextStyle(color:grey,fontWeight:FontWeight.w700),),
                      const SizedBox(height:16,),
                      Row(
                        children: [
                          InkWell(
                            onTap:(){
                              _selectDateone();
                            },
                            child: Container(
                              padding:const EdgeInsets.only(left:15,right:15),
                              width:118,
                              height:37,
                              decoration:BoxDecoration(
                                color:dark,
                                borderRadius:BorderRadius.circular(5),
                              ),
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedData == null ? "str_from".tr() : selectedData.toString(),style:const TextStyle(color:grey),),
                                  SvgPicture.asset(AppIcons.calendar),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width:5,),
                          Container(
                            height:2,
                            width:8,
                            color:grey,
                          ),
                          const SizedBox(width:5,),
                          InkWell(
                            onTap:(){
                              _selectDatetwo();
                            },
                            child: Container(
                              padding:const EdgeInsets.only(left:15,right:15),
                              width:118,
                              height:37,
                              decoration:BoxDecoration(
                                color:dark,
                                borderRadius:BorderRadius.circular(5),
                              ),
                              child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedDatatwo == null ? "str_to".tr() : selectedDatatwo.toString(),style:const TextStyle(color:grey),),
                                  SvgPicture.asset(AppIcons.calendar),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height:16,),
                      ListView.separated(
                        padding:EdgeInsets.zero,
                        itemCount:items.length,
                        shrinkWrap:true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index){
                          return ContractItem(user:items, index:index,);
                        }, separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height:4,);
                      },
                      ),
                    ],
                  ),
                ),
              ):ContractEmpty(text: "str_made".tr(), icon:AppIcons.nodata,),
          ),
        ],
      ),
    );
  }
}
