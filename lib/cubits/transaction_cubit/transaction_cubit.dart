import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/transaction_cubit/transaction_cubit_states.dart';
import 'package:training/firabase/check_email.dart';

import '../../firabase/send_money_update_balance.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(InitialCartState());
  List emailValidationResault = [];

  sendMoneyCubit({
    required String receiverEmail,
    required String amount,
  }) async {
    emit(OnProgressTransactionState());
    try {
      emailValidationResault = await validateEmail(
        receiverEmail: receiverEmail,
      );
      if (emailValidationResault[0]) {
        double balance = await getBalanceFromFireStore();
        if (balance >= double.parse(amount)) {
          await sendMoneyAndUpdateBalance(
            receiverId: emailValidationResault[1],
            balance: balance,
            sentMoney: amount,
          );
          emit(SucseedTransactionState());
        } else {
          emit(NotEnoughAmountTransactionState());
        }
      } else {
        emit(NoEmailState());
      }
    } catch (e) {
      emit(ErrorTransactionState(errMessage: e.toString()));
    }
  }

  void resetState() {
    emit(InitialCartState());
  }
}
