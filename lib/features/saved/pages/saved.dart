import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/data/models/contract_model.dart';
import 'package:ibilling/features/contracts/pages/contracts_filters.dart';
import 'package:ibilling/features/contracts/pages/contracts_search.dart';
import 'package:ibilling/features/contracts/pages/widgets/contarct_app_bar.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_empty.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_item.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_list.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final List items =item;
  bool empty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          ContractAppBar(
            text: "str_saved".tr(),
            onPressedFilter: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ContractsFilter()),
              );
            },
            onPressedSearch: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContractsSearch()),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: empty
                ? SingleChildScrollView(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ContractItem(
                          user: items,
                          index: index,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 4,
                        );
                      },
                    ),
                  )
                : ContractEmpty(
                    text: "str_made".tr(),
                    icon: AppIcons.book,
                  ),
          ),
        ],
      ),
    );
    ;
  }
}
