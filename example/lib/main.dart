import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F2EEA),
        title: const Text('Custom Credit Card Input Form'),
      ),
      body: CustomCreditCardForm(creditCardCallBack: (CreditCardModel creditCardModel) {
        //show toast or snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Card Number: ${creditCardModel.cardNumber}\n'
              'Expiry Date: ${creditCardModel.expiryDate}\n'
              'Card Holder Name: ${creditCardModel.cardHolderName}\n'
              'CVV Code: ${creditCardModel.cvvCode}',
              style: const TextStyle(fontSize: 18),
            ),
            duration: const Duration(milliseconds: 5000),
          ),
        );
      }),
    );
  }
}
