// lib/features/expenses/presentation/pages/home_page.dart
import 'package:expenses_tracker/features/expenses/presentation/controllers/expensses_controller.dart';
import 'package:expenses_tracker/features/expenses/presentation/controllers/income_controller.dart';
import 'package:expenses_tracker/features/expenses/presentation/pages/add_expense_page.dart';
import 'package:expenses_tracker/features/expenses/presentation/widgets/my_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/expense_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expenseControllerProvider);
    final controller = ref.read(expenseControllerProvider.notifier);

    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        child: const Icon(Icons.add, size: 25),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddExpensePage()),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'H O M E',
          style: TextStyle(color: Colors.teal, fontSize: 30),
        ),
      ),
      body: expensesAsync.when(
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (expensesList) {
          if (expensesList.isEmpty) {
            return const Center(child: Text('No expenses yet'));
          }
          final income = ref.watch(incomeProvider);

          final total = controller.sumCosts(expensesList);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(
                  MediaQuery.of(context).size.width * 0.01,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.teal[700],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Income:${income.toString()} ',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text(
                      'Expenses:$total',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          
              
             Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.teal
              ),
              child: Center(
                child: Text('Money left:${ref.watch(incomeProvider.notifier).calculateMoneyLeft(total)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),
              ),
             ),
          
             Center(
               child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width*0.7,
                  child: PieChart(
                    PieChartData(
                      
                      centerSpaceRadius: double.infinity,
                      centerSpaceColor: Colors.transparent,
                      
                      sections: [
                        PieChartSectionData(
                         value: ref.watch(incomeProvider.notifier).calculateMoneyLeft(total)
                        ,  color: Colors.green
                        ),
                        PieChartSectionData(
                         value: total,
                         color:  Colors.red
                  
                        ),
                      ]
                    )
                  ),
                ),
             ),

             Column(children: [
            Row(
              children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 12,
                height: 12,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Income'),
            ],),
            Row(
              children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 12,
                height: 12,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Expenses'),
            ],)
             ],),
             SizedBox(
              height: 15,
             ),
              
              
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.4,
                    crossAxisCount: 2,
                  ),
                  itemCount: expensesList.length,
                  itemBuilder: (_, index) {
                    return ExpenseCard(
                      expense: expensesList[index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
