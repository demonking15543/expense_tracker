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
 
  @override
  void dispose(){
    _titleController.dispose();
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
        Row(children: [
          ElevatedButton(onPressed: (){
            print(_titleController.text);
          }, child: const Text("Save Expense"))
        ],)
      ],
    ),);
  }
}