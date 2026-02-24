import 'package:expenses_tracker/features/expenses/presentation/pages/income_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S  E  T  T  I  N  G  S'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
               return IncomePage();
              }));
            },
            child: Container(
              width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal,
                        ),
                        child: Center(child: Text('Add/Update Income',style: TextStyle(
                          fontSize: 20
                        ),)),
                      ),
          ),
        ],
      ),
    );
  }
}