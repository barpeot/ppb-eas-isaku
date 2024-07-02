import 'package:eas_isaku/screens/login_screen.dart';
import 'package:eas_isaku/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class RegisterAddBank extends StatefulWidget {
  const RegisterAddBank({super.key});

  @override
  _RegisterAddBankState createState() => _RegisterAddBankState();
}

class _RegisterAddBankState extends State<RegisterAddBank> {
  final _formKey = GlobalKey<FormState>();
  late String _selectedBank = 'Choose One';
  late String _bankNo;
  bool _obscureText = true;

  List<String> banks = ['Choose One', 'Bank A', 'Bank B', 'Bank C', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bank Information'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Select your bank',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedBank,
                onChanged: (newValue) {
                  setState(() {
                    _selectedBank = newValue!;
                  });
                },
                items: banks.map((bank) {
                  return DropdownMenuItem<String>(
                    value: bank,
                    child: Text(bank),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a bank';
                  }
                  return null;
                },
                onSaved: (value) {
                  _selectedBank = value!;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter your bank account number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextFormField(
                obscureText: _obscureText,
                decoration: const InputDecoration(
                  hintText: 'Enter your bank account number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bank account number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _bankNo = value!;
                },
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 48),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
