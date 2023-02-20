import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/assets/icons/app_icons.dart';
import 'package:ibilling/features/contracts/pages/blocs/contract_bloc.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_filter_button.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_item.dart';
import 'package:ibilling/features/contracts/pages/widgets/contract_status.dart';
import 'package:intl/intl.dart';

class ContractsFilter extends StatefulWidget {
  const ContractsFilter({Key? key}) : super(key: key);

  @override
  State<ContractsFilter> createState() => _ContractsFilterState();
}

class _ContractsFilterState extends State<ContractsFilter> {
  @override
  bool one = false;
  bool two = false;
  bool there = false;
  bool four = false;
  DateTime? fromDate;
  DateTime? toDate;

  void _selectDateone() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((piscedDate) {
      if (piscedDate == null) {
        return;
      }
      fromDate = piscedDate;
      setState(() {});
    });
  }

  void _selectDatetwo() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((selectDate) {
      if (selectDate == null) {
        return;
      }
      toDate = selectDate;
      setState(() {});
    });
  }

  String? formatDate(DateTime? selectDate) {
    return DateFormat.yMd().format(selectDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkets,
        title:Text("str_filters".tr()),
      ),
      body: BlocBuilder<ContractBloc, ContractState>(
        builder: (context, state) {
          print(state.status);
          print(state.initialDate);
          if (state.status.isPure) {
            context.read<ContractBloc>().add(GetContractsEvent());
          } else if (state.status.isSubmissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state.status.isSubmissionSuccess) {
            return Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 30, bottom: 30),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "str_status".tr(),
                        style:
                            const TextStyle(color: grey, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ContractStatus(),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        "str_date".tr(),
                        style:
                          const  TextStyle(color: grey, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _selectDateone();
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 116,
                              height: 37,
                              decoration: BoxDecoration(
                                color: dark,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    fromDate == null
                                        ? 'str_from'.tr()
                                        : formatDate(fromDate)!,
                                    style: const TextStyle(color: grey),
                                  ),
                                  SvgPicture.asset(AppIcons.calendar),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 2,
                            width: 8,
                            color: grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              _selectDatetwo();
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: 116,
                              height: 37,
                              decoration: BoxDecoration(
                                color: dark,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    toDate == null ? 'str_to'.tr() : formatDate(toDate)!,
                                    style: const TextStyle(color: grey),
                                  ),
                                  SvgPicture.asset(AppIcons.calendar),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: state.filteredContractList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ContractItem(
                                user: state.filteredContractList,
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
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              ContractFilterButton(
                                onTap: () {},
                                text: "str_cancel".tr(),
                                style: const TextStyle(color: darkgreen),
                                color: darkgreen.withOpacity(0.3),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              ContractFilterButton(
                                onTap: () {
                                  if (toDate != null && fromDate != null) {
                                    context.read<ContractBloc>().add(
                                        IncrementFilterDate(
                                            toDate: toDate!,
                                            fromDate: fromDate!));
                                  }
                                },
                                text: "str_filters".tr(),
                                style: const TextStyle(color: white),
                                color: darkgreen,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  //button
                ],
              ),
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
