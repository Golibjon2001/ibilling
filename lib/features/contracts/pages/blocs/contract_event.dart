part of 'contract_bloc.dart';

@immutable
abstract class ContractEvent {}

class GetContractsEvent extends ContractEvent {}

class GetByDateContractEvent extends ContractEvent {
  final DateTime date;

  GetByDateContractEvent({required this.date});
}

class IncrementDate extends ContractEvent {
  final DateTime date;

  IncrementDate({required this.date});
}
class DecrementDate extends ContractEvent {
  final DateTime date;

  DecrementDate({required this.date});
}

//
class IncrementFilterDate extends ContractEvent{

  final DateTime fromDate;
  final DateTime toDate;

  IncrementFilterDate({required this.toDate, required this.fromDate});
}

