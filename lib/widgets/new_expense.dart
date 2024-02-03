import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{

const NewExpense({super.key});

@override
  State<NewExpense> createState(){
    return _NewStateExpense();
  }

}

class _NewStateExpense extends State<NewExpense>{
  // var _enteredTitle ='';
  // void _saveTitleInput(String inputValue){
  //    _enteredTitle=inputValue;


  // }

  final _titleController = TextEditingController();
 final _amountController = TextEditingController();

  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
    child:  Column(
      children:  [
        TextField(
          maxLength: 50,
          // onChanged:_saveTitleInput ,
         
         controller: _titleController,
          decoration: const InputDecoration(
            label: Text("Title")
          ),
        ),


         TextField(
          // onChanged:_saveTitleInput ,
         
         controller: _amountController,
         keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixText: '\$ ',
            label: Text("Amount")
          ),
        ),
        
        
        Row(children: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Cancel")),
          ElevatedButton(onPressed: (){
            print(_titleController.text);
            print(_amountController.text);

          }, child: const Text("Save Expense"))
        ],)
      ],
    ),);
  }
}