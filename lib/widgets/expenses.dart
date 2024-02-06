import 'package:expense_tracker/modals/expense.dart';
import 'package:expense_tracker/widgets/expenseslist/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

import 'package:flutter/material.dart';
class Expenses extends StatefulWidget{
   const Expenses({super.key});
  @override

  State<Expenses> createState(){
 return _ExpensesState();
  }
}



class _ExpensesState extends State<Expenses>{
 
 final List<Expense> _registeredExpenses=[
  Expense(title: 'News paper', 
  amount: "10.00",
  date: DateTime.now(),
  category: Category.work,
   ),
   Expense(title: 'Breakfast', 
  amount: "60.00",
  date: DateTime.now(),
  category: Category.food,
   )
 ];


 void _openAddExpenseOverlay(){
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
     builder: (ctx)=>  NewExpense(onAddExpense:_addExpense));

 }

 void _addExpense(Expense expense){
  setState(() {
      _registeredExpenses.add(expense);

    
  });
 }
 void _removeExpense(Expense expense){
  setState(() {
      _registeredExpenses.remove(expense);

    
  });
  
 }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Expenxse Tracker") ,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
             icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
       children:  [
        const Text('Chart'),
        Expanded(child: ExpensesList(expenses: _registeredExpenses, onRemoveExpense:_removeExpense ,))
        ], 
      ),
    );
  }
}