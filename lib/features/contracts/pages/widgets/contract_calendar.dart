import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/features/contracts/pages/blocs/contract_bloc.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../assets/icons/app_icons.dart';

class ContractCalendar extends StatelessWidget {
  final ContractState state;

  const ContractCalendar({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
      height: 148,
      width: MediaQuery.of(context).size.width,
      color: darker,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(Jiffy(state.initialDate).format('dd.MM.yyyy'),
                //"February",
                style: const TextStyle(color: white, fontSize: 18),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<ContractBloc>()
                            .add(DecrementDate(date: state.initialDate));
                      },
                      icon: SvgPicture.asset(
                        AppIcons.right,
                        color: white,
                      )),
                  IconButton(
                      onPressed: () {
                        context
                            .read<ContractBloc>()
                            .add(IncrementDate(date: state.initialDate));
                      },
                      icon: SvgPicture.asset(
                        AppIcons.left,
                        color: white,
                      ))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          DatePicker(
            state.initialDate,
            height: 72,
            width: 55,
            initialSelectedDate: state.initialDate,
            selectionColor: green,
            selectedTextColor: Colors.white,
            dayTextStyle: const TextStyle(color: Colors.grey, fontSize: 10),
            monthTextStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
            dateTextStyle: const TextStyle(
              color: Colors.grey,
            ),
            onDateChange: (date) {
              context.read<ContractBloc>().add(GetByDateContractEvent(date: date));
            },
          ),
        ],
      ),
    );
  }
}
