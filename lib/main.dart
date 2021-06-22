import 'package:expense_tracker/screens/add_screen2.dart';
import 'package:expense_tracker/screens/expense.dart';
import 'package:expense_tracker/screens/homeScreen.dart';
import 'package:expense_tracker/screens/home_page.dart';
import 'package:expense_tracker/screens/onbording.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpenseApp());

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF5956ea),
      ),
      debugShowCheckedModeBanner: false,
      home: AddDataScreen(),
    );
  }
}
