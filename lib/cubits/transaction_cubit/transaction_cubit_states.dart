class TransactionState {}

class InitialCartState extends TransactionState {}

class SucseedTransactionState extends TransactionState {}

class NotEnoughAmountTransactionState extends TransactionState {}

class NoEmailState extends TransactionState {}

class ErrorTransactionState extends TransactionState {
  final String errMessage;
  ErrorTransactionState({required this.errMessage});
}

class OnProgressTransactionState extends TransactionState {}
