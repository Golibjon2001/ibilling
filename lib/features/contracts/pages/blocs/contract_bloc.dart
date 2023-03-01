


import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:ibilling/assets/colors/colors.dart';
import 'package:ibilling/features/contracts/data/models/contract_model.dart';
import 'package:meta/meta.dart';
part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  ContractBloc()
      : super(ContractState(
          contractList: const [],
          status: FormzStatus.pure,
          initialDate: DateTime.now(),
          filteredContractList: const [],
        )) {
    List<ContractModel> items =   [
      ContractModel(
          date: state.initialDate,
          name: "Ziyoda",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:lightgreen,
          text: "str_paid".tr()),
      ContractModel(
          date: state.initialDate.add(const Duration(days:1)),
          name: "Nigora",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:read,
          text: "str_payme".tr()),
      ContractModel(
          date: state.initialDate.add(const Duration(days:2)),
          name: "Alexs",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:orange,
          text: "str_paid".tr()),
      ContractModel(
          date: state.initialDate.add(const Duration(days:3)),
          name: "Asror",
          id: 1,
          salary: "2200 USD",
          number: 26,
          invoise: "3",
          color:lightgreen,
          text: "str_payme".tr()),
      ContractModel(
          date: state.initialDate.add(const Duration(days: 4)),
          name: "Joni",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:read,
          text: "str_rejected".tr()),
      ContractModel(
          date: state.initialDate.subtract(const Duration(days: 1)),
          name: "Ilxom",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:orange,
          text: "str_process".tr()),
      ContractModel(
          date: state.initialDate.add(const Duration(days: 5)),
          name: "Ozod",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:orange,
          text: "str_process".tr()),
      ContractModel(
          date: state.initialDate.subtract(const Duration(days: 2)),
          name: "Joni",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:read,
          text: "str_rejected".tr()),
      ContractModel(
          date: state.initialDate.subtract(const Duration(days: 3)),
          name: "Alexs",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:lightgreen,
          text: "str_payme".tr()),
      ContractModel(
          date: state.initialDate.subtract(const Duration(days: 4)),
          name: "Ozod",
          id: 1,
          salary: "1200 USD",
          number: 26,
          invoise: "3",
          color:orange,
          text: "str_process".tr()),
    ];

    on<GetContractsEvent>((event, emit) async {
      final List<ContractModel> contractList = [];

      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      for (var element in items) {
        if (state.initialDate.day == element.date.day) {
          contractList.add(element);
        }
      }
      try {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          contractList: contractList,
        ));
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });


    on<GetByDateContractEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final List<ContractModel> list = [];
      for (var element in items) {
        if (element.date.day == event.date.day) {
          list.add(element);
        }
      }
      print(list.length);
      emit(state.copyWith(
          contractList: list, status: FormzStatus.submissionSuccess));
    });


    on<IncrementDate>((event, emit) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      print('call  IncrementDate event');
      final date = state.initialDate.add(const Duration(days:6));
      emit(state.copyWith(
          initialDate: date, status: FormzStatus.submissionSuccess));
    });

    on<DecrementDate>((event, emit) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      print('call  IncrementDate event');
      final date = state.initialDate.subtract(const Duration(days:6));
      emit(state.copyWith(
          initialDate: date, status: FormzStatus.submissionSuccess));
    });


    on<IncrementFilterDate>((event, emit){
      emit(state.copyWith(status:FormzStatus.submissionInProgress));
      final List<ContractModel> filteredContractList = [];

      final fromDay = event.fromDate.day;
      final toDay = event.toDate.day;

      for(var item in items){
        if(fromDay <= item.date.day && toDay >= item.date.day){
          filteredContractList.add(item);
        }
      }
      try {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          filteredContractList: filteredContractList,
        ));
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }

    });
  }
}
