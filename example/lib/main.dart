import 'package:example/credit_card_input_form.dart';
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
        title: const Text('Customized Card Input Form'),
      ),
      body: CreaditCardInputForm(creditCardCallBack: (CreditCardModel creditCardModel) => print(creditCardModel.toString())),
    );
  }
}
