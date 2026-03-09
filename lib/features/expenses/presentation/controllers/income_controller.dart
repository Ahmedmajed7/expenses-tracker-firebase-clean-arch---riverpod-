import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final incomeProvider = NotifierProvider<IncomeController,double>(
  IncomeController.new
);

class IncomeController extends Notifier<double>{
  
  @override
  double build() {
    getIncomeFromCache();
    return 0;
  }

  void setIncome (double value)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  state = value;
  await prefs.setDouble('income', value);
  }

  void getIncomeFromCache()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getDouble('income')?? 0 ;

  }

 double calculateMoneyLeft (double expenses){
    double moneyLeft = state - expenses;
    return moneyLeft;
  }
}