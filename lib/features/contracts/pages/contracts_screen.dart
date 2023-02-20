import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/pages/blocs/contract_bloc.dart';
import 'package:ibilling/features/contracts/pages/contracts_filters.dart';
import 'package:ibilling/features/single/pages/single.dart';
import 'package:ibilling/features/contracts/pages/widgets/contarct_app_bar.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_calendar.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_empty.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_item.dart';
import 'contracts_search.dart';

class ContractsScreen extends StatefulWidget {
  const ContractsScreen({Key? key}) : super(key: key);

  @override
  State<ContractsScreen> createState() => _ContractsScreenState();
}

class _ContractsScreenState extends State<ContractsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: BlocBuilder<ContractBloc, ContractState>(
        builder: (context, state) {
          print(state.status);
          print(state.initialDate);
          if (state.status.isPure) {
            context.read<ContractBloc>().add(GetContractsEvent());
          } else if (state.status.isSubmissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state.status.isSubmissionSuccess) {
            return Column(
              children: [
                ContractAppBar(
                  text: 'str_contracts'.tr(),
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
                      MaterialPageRoute(
                          builder: (context) => ContractsSearch()),
                    );
                  },
                ),
                ContractCalendar(state: state),
                Expanded(
                  child: state.contractList.isNotEmpty
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 32),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: green,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ContractsSingle()));
                                      },
                                      child:Text(
                                        "str_contracts".tr(),
                                        style:const TextStyle(
                                            color: white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: black,
                                      ),
                                      onPressed: () {},
                                      child:Text(
                                        "str_invoice".tr(),
                                        style:const TextStyle(
                                            color: white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: state.contractList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ContractItem(
                                      user: state.contractList,
                                      index: index,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 4,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        )
                      : ContractEmpty(
                          text: 'str_made'.tr(),
                          icon: AppIcons.nodata,
                        ),
                ),
              ],
            );
          } else if (state.status.isSubmissionFailure) {
            return Center(child: Text('str_fail'.tr()));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
