import 'package:expenses_tracker/features/expenses/presentation/controllers/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomePage extends ConsumerWidget {
  IncomePage({super.key});

  final TextEditingController incomeController = TextEditingController();

  @override
  Widget build(BuildContext context , WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('I  N  C  O  M  E'),
      ),body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
        
          TextField(
            controller: incomeController,
            decoration: InputDecoration(
              hint: Text('Please enter your income'),
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(
            height: 20,
          ),

          InkWell(
            onTap: () {
              ref.read(incomeProvider.notifier).setIncome(double.parse(incomeController.text.trim()));
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.teal
              ),
              child: Text('SAVE'),
            ),
          )
        ],),
      ),
    );
  }
}