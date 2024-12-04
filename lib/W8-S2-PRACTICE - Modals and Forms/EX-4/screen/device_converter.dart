import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _amountController = TextEditingController();
  String? _selectedDevice; // To hold the selected currency
  double _convertedAmount = 0.0;
  // Define conversion rates
  final Map<String, double> conversionRates = {
    'EURO': 0.85, // $1 - Euro
    'RIELS': 4000.0, // $1 - Riel
    'DONG': 23000.0, // $1 -  Dong
  };

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  void _convert() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null && _selectedDevice != null) {
      setState(() {
        _convertedAmount = amount * conversionRates[_selectedDevice]!;
      });
    } else {
      setState(() {
        _convertedAmount = 0.0; // Reset if input is invalid
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.money,
              size: 60,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Amount in dollars:"),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only numbers
              ],
              onChanged: (value) {
                _convert(); // Trigger conversion on input change
              },
            ),
            const SizedBox(height: 30),
            const Text("Device: "),
            DropdownButton<String>(
              value: _selectedDevice,
              hint: const Text("Select Currency"),
              items: <String>['EURO', 'RIELS', 'DONG'].map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDevice = newValue; // Update selected device
                  _convert(); // Trigger conversion on selection change
                });
              },
            ),
            const SizedBox(height: 30),
            const Text("Amount in selected device:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(
                _selectedDevice != null
                    ? '${_convertedAmount.toStringAsFixed(2)} '
                    : 'Please select a currency',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
