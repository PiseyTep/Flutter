import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // For date formatting
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? _selectedCategory; //  selected category
  DateTime? _selectedDate; // selected date

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void onCancel() {
    Navigator.pop(context); // Close modal on cancel
  }

  void onAdd() {
    // 1- Get the values from the inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);
    DateTime selectedDate = _selectedDate ??
        DateTime.now(); // Default to current date if no date selected
    // 2 -  Validate the inputs
    bool isTitleValid = title.trim().isNotEmpty;
    bool isAmountValid = amount != null && amount > 0;
    bool valid = isTitleValid && isAmountValid;

    if (valid) {
      // 2- Create the expense object
      Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate, // Use selected date
        category: _selectedCategory ??
            Category.food, // Default to 'food' if no category selected
      );

      // 3- Pass the expense to the parent widget
      widget.onCreated(expense);

      // 4- Close the modal
      Navigator.pop(context);
    } else {
      // 4.1 Compute the error message
      String errorMessage = !isTitleValid
          ? "The title cannot be empty"
          : "The amount shall be a positive number";
      // 4.2 Show error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title Input
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 10),

          // Amount and Date Picker
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _valueController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : DateFormat.yMd().format(_selectedDate!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Category Picker & Action Buttons (Cancel and Save)
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Category Picker
              DropdownButton<Category>(
                value: _selectedCategory,
                hint: const Text('Select Category'),
                items: Category.values.map((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (Category? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
              //Action Buttons (Cancel and Save)
              const Spacer(),
              ElevatedButton(
                onPressed: onCancel,
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onAdd,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
