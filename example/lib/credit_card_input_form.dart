import 'package:example/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CreaditCardInputForm extends StatefulWidget {
  const CreaditCardInputForm({Key? key, required this.creditCardCallBack}) : super(key: key);
  final void Function(CreditCardModel) creditCardCallBack;

  @override
  State<CreaditCardInputForm> createState() => _CreaditCardInputFormState();
}

class _CreaditCardInputFormState extends State<CreaditCardInputForm> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextStyle hintStyle = const TextStyle(color: Color(0xFFA9A6BE), fontSize: 16.0);
  final TextStyle textStyle = const TextStyle(color: Color(0xFF2F2C35), fontSize: 16.0);
  OutlineInputBorder border =
      const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFDDDDE8), width: 1.0), borderRadius: BorderRadius.all(Radius.circular(10)));
  final OutlineInputBorder focusBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 71, 44, 250), width: 1.0), borderRadius: BorderRadius.all(Radius.circular(10)));
  final OutlineInputBorder errorBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 1.0), borderRadius: BorderRadius.all(Radius.circular(10)));
  bool isValidated = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          cardBgColor: AppColors.cardBgColor,
          backgroundImage: 'assets/card_image.png',
          isSwipeGestureEnabled: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
        ),
        Expanded(
          child: CreditCardForm(
            formKey: formKey,
            cardNumber: cardNumber,
            cvvCode: cvvCode,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            cardHolderName: cardHolderName,
            expiryDate: expiryDate,
            themeColor: Colors.blue,
            textColor: Colors.white,
            textStyle: textStyle,
            cardNumberDecoration: InputDecoration(
              prefixIcon: Image.asset('assets/card_number.png'),
              hintText: 'XXXX-XXXX-XXXX-XXXX',
              hintStyle: hintStyle,
              focusedBorder: focusBorder,
              enabledBorder: border,
              focusedErrorBorder: errorBorder,
              errorBorder: errorBorder,
            ),
            expiryDateDecoration: InputDecoration(
              prefixIcon: Image.asset('assets/card_date.png'),
              hintStyle: hintStyle,
              focusedBorder: focusBorder,
              enabledBorder: border,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
              hintText: 'MM/YY',
            ),
            cvvCodeDecoration: InputDecoration(
              prefixIcon: Image.asset('assets/card_cvv.png'),
              hintStyle: hintStyle,
              focusedBorder: focusBorder,
              enabledBorder: border,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              prefixIcon: Image.asset('assets/card_name.png'),
              hintStyle: hintStyle,
              focusedBorder: focusBorder,
              enabledBorder: border,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
              hintText: 'CARD HOLDER NAME',
            ),
            onCreditCardModelChange: onCreditCardModelChange,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48.0,
              child: ElevatedButton(
                onPressed: isValidated ? () => widget.creditCardCallBack(CreditCardModel(cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused)) : null,
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.transparent,
                    backgroundColor: isValidated ? const Color(0xFF5F2EEA) : const Color(0xFFDDDDE8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: isValidated ? Colors.white : const Color(0xFFA9A6BE),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      isValidated = true;
      return;
    }
    isValidated = false;
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
      _onValidate();
    });
  }
}
