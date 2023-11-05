import 'dart:io';

import 'package:expense/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.addExpense, super.key});
  final void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _entered_value = "";
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectDate;
  Category selectedCategory = Category.leisure;

  void _datePicker() async {
    final iniDate = DateTime.now();
    final firstDate = DateTime(iniDate.year - 1, iniDate.month, iniDate.day);
    final pickdate = await showDatePicker(
        context: context,
        initialDate: iniDate,
        firstDate: firstDate,
        lastDate: iniDate);
    setState(() {
      selectDate = pickdate;
    });
  }

  void dialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                  title: const Text("Error in data"),
                  content: const Text("Enter valid details"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"))
                  ]));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error in data"),
          content: const Text("Enter valid details"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  void validateData() {
    final amount = double.tryParse(_amountController.text);
    final amountInvalid = amount == null || amount <= 0;
    final title = _titleController.text.trim();
    if (title.isEmpty || amountInvalid || selectDate == null) {
      dialog();
      return;
    }

    widget.addExpense(Expense(
        title: title,
        amount: amount,
        date: selectDate!,
        category: selectedCategory));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // void _savedtitle(String value) {
  //   _entered_value = value;
  // }

  @override
  Widget build(BuildContext context) {
    final keyboardspace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (context, contraints) {
      final width = contraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardspace + 16),
            child: Column(children: [
              TextField(
                controller: _titleController,
                maxLength: 15,
                decoration: const InputDecoration(label: Text("title")),
              ),
              Row(children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    maxLength: 15,
                    decoration: const InputDecoration(
                        prefixText: '\$', label: Text("amount")),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(selectDate == null
                        ? "Select Date"
                        : formatter.format(selectDate!)),
                    IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.date_range))
                  ],
                ))
              ]),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: selectedCategory,
                      items: Category.values
                          .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase())))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          selectedCategory = value;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                      onPressed: validateData,
                      child: const Text("Save Expense"))
                ],
              )
            ]),
          ),
        ),
      );
    });
  }
}
