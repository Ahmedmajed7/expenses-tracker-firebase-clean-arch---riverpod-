import 'package:expenses_tracker/features/theme/presentation/widgets/theme_card.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Text(
                'Expense Tracker',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[300],
                ),
              ),
              Divider(thickness: 0.8, endIndent: 0.5),
              SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Text('S E T T I N G S'),
                    ),
                  ),
                  ThemeCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
