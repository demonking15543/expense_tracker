
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid =  Uuid();
final DateTime now = DateTime.now();
final DateFormat f = DateFormat('dd/MM/yy');

final formater = f;

enum Category  {travel, food, leisure, work  }
const categoryIcons ={
  Category.food: Icons.lunch_dining,
  Category.travel:Icons.flight,
    Category.leisure:Icons.movie,
      Category.work:Icons.work,


};

class Expense{

  Expense({
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category
    }) : id = uuid.v4() ;
    
  final String id;
  final String title;
  final String amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formater.format(date);

  }

  
}