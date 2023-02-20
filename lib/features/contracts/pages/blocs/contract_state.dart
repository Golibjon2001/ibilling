part of 'contract_bloc.dart';

@immutable
class ContractState extends Equatable {
  final List<ContractModel> contractList;
  final List<ContractModel> filteredContractList;
  final FormzStatus status;
  final DateTime initialDate;

  const ContractState({
    required this.status,
    required this.contractList,
    required this.filteredContractList,
    required this.initialDate,
  });

  ContractState copyWith({
    List<ContractModel>? contractList,
    List<ContractModel>? filteredContractList,
    FormzStatus? status,
    DateTime? initialDate,
  }) =>
      ContractState(
        status: status ?? this.status,
        contractList: contractList ?? this.contractList,
        filteredContractList: filteredContractList ?? this.filteredContractList,
        initialDate: initialDate ?? this.initialDate,
      );

  @override
  List<Object?> get props => [status, contractList, filteredContractList, initialDate];
}
