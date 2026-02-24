import 'package:flutter_riverpod/flutter_riverpod.dart';

final incomeProvider = NotifierProvider<IncomeController,double>(
  IncomeController.new
);

class IncomeController extends Notifier<double>{
  
  @override
  double build() {
    return 0;
  }

  void setIncome (double value){
  state = value;
  }

 double calculateMoneyLeft (double expenses){
    double moneyLeft = state - expenses;
    return moneyLeft;
  }
}