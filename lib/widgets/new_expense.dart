import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/modals/expense.dart';
final formatter = DateFormat.yMd();
class NewExpense extends StatefulWidget{

const NewExpense({super.key, required this.onAddExpense});
final Function(Expense expense) onAddExpense;

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
 DateTime? _selectedDate;
 Category _selectedCategory = Category.leisure;

void _presentDatePicker  () async{
  final now = DateTime.now();
  final firstDate = DateTime(now.year-1, now.month, now.day);


 final pickedDate =  await  showDatePicker(
    context: context,
     initialDate: now,
      firstDate: firstDate,
       lastDate: now);
       setState(() {
         _selectedDate=pickedDate;
       });

      
}

void _submitFormData(){
 final enteredAmount = double.tryParse(_amountController.text);
 final amountIsInvalid = enteredAmount==null || enteredAmount <=0;

  if(_titleController.text.trim().isEmpty ||
   amountIsInvalid ||
    _selectedDate == null){
    // show error message
    showDialog(
      context: context, 
      builder: (ctx)=>  AlertDialog(
      title:  const Text("Invali Input"),
      content:  const Text("Please make your a valid title, amount and selected date."),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(ctx);
        }, child:const  Text("Close"))
      
     ],
    ));
  return;
  }
  widget.onAddExpense(Expense(
    title: _titleController.text,
     amount: enteredAmount.toString(),
      date:_selectedDate! ,
       category: _selectedCategory));


}
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

   Row(children: [
         Expanded(child: TextField(
          // onChanged:_saveTitleInput ,
         
         controller: _amountController,
         keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixText: '\$ ',
            label: Text("Amount")
          ),
        )),
        const SizedBox(width: 16,),
       Expanded( 
        child :Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(_selectedDate==null ?"No Selected Date": formatter.format(_selectedDate!)),
          IconButton(onPressed: _presentDatePicker, icon: const Icon(Icons.calendar_month))
        ],))


        
   ],),

        const SizedBox(height: 16,),

        Row(children: [
          DropdownButton(
            value: _selectedCategory,
            items: Category.values.map(
              (category) =>DropdownMenuItem(
                value: category,
                child: Text(
                  category.name.toUpperCase())) ).toList(), onChanged: (value){
                   setState(() {
                    if(value==null){
                      return;
                    }
                     _selectedCategory=value;
                   });
                  }),
                  const Spacer(),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Cancel")),
          ElevatedButton(onPressed:_submitFormData
          , child: const Text("Save Expense"))
        ],)
      ],
    ),);
  }
}