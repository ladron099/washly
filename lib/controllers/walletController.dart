import 'package:get/get.dart';
import 'package:washly/utils/models/transaction.dart';
import 'package:washly/utils/static_transactions.dart';

class WalletController extends GetxController{
    int currIndex = 0;
  List<Transaction> filtredTransactions = transactions;

  switchIndex(index) {
    currIndex = index;
    if (currIndex == 0) {
      filtredTransactions = transactions;
    }else if(currIndex == 1){
      filtredTransactions = transactions.where((element) => element.transactionType == 0).toList();
    }
    else if(currIndex == 2){
      filtredTransactions = transactions.where((element) => element.transactionType == 1).toList();
    }
    update();
  }
}