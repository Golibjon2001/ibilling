import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/data/models/contract_model.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_empty.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_item.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_list.dart';

class ContractsSearch extends StatefulWidget {
  ContractsSearch({Key? key}) : super(key: key);

  @override
  State<ContractsSearch> createState() => _ContractsSearchState();
}

class _ContractsSearchState extends State<ContractsSearch> {
  final searchCtrl = TextEditingController();
  String searchText = '';
  List items = item;
  List<ContractModel> newItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: darkets,
        title: TextField(
          controller: searchCtrl,
          style:const TextStyle(color: white),
          cursorColor: white,
          decoration:InputDecoration(
            hintText: "str_search".tr(),
            hintStyle: TextStyle(color: grey),
            border: InputBorder.none,
          ),
          onChanged: (val) {
            setState(() {
              searchText = val;
               newItems = [];
              for (var user in items) {
                if (user.name.toUpperCase() == searchText.toUpperCase()) {
                  newItems.add(user);
                }
              }
            });
          },
        ),
        actions: [
          GestureDetector(
            onTap: (){
              setState(() {
                newItems=[];
                searchCtrl.text= '';
              });
            },
              child: SvgPicture.asset(AppIcons.vector)),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: searchText.isEmpty
          ? ContractEmpty(text: 'str_made'.tr(), icon:AppIcons.nodata,)
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: newItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                    return ContractItem(
                      user: newItems,
                      index: index,
                    );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 4,
                  );
                },
              ),
            ),
    );
  }
}
