import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/card.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/utils/constants.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/cvv_field.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/hold_field.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/number_field.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/widgets/field/valid_thru_field.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/providers/cardprovider.dart';
import 'package:food_app/view/delivery_progress_page.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final formKey = GlobalKey<FormState>();
  final holder = TextEditingController();
  final number = TextEditingController();
  final cvv = TextEditingController();
  final validthru = TextEditingController();

  void userTappedPay() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Card Number : ${number.text}'),
                Text('Expiry Date : ${validthru.text}'),
                Text('Card Holder name : ${holder.text}'),
                Text('CVV : ${cvv.text}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                );
              },
              child: Text(
                'Yes',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CheckOut'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<Cardprovider>(
              builder: (context, provider, child) {
                return FMCreditCard(
                  number: provider.cardNumber,
                  numberMaskType: FMMaskType.first6last2,
                  cvv: provider.cvvCode,
                  cvvMaskType: FMMaskType.full,
                  validThru: provider.expiryDate,
                  validThruMaskType: FMMaskType.none,
                  holder: provider.holderName,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                  key: formKey,
                  child: Consumer<Cardprovider>(
                    builder: (context, provider, child) {
                      return Column(
                        children: [
                          FMHolderField(
                            controller: holder,
                            onChanged: (value) {
                              provider.getCardHolder(name: value);
                            },
                            cursorColor: const Color(0xFF49B7AE),
                            decoration: InputDecoration(
                              labelText: "Card Holder",
                              hintText: "John Doe",
                            ),
                          ),
                          const SizedBox(height: 30),
                          FMNumberField(
                            onChanged: (data) {
                              provider.getCardNumber(cardNumber: data);
                            },
                            controller: number,
                            cursorColor: const Color(0xFF49B7AE),
                            decoration: InputDecoration(
                              labelText: "Card Number",
                              hintText: "0000 0000 0000 0000",
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: FMValidThruField(
                                  onChanged: (value) {
                                    provider.getExpirydate(expiry: value);
                                  },
                                  controller: validthru,
                                  // cursorColor: const Color(0xFF49B7AE),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF49B7AE),
                                      ),
                                    ),
                                    // labelStyle: TextStyle(color: Color(0xFF49B7AE)),
                                    labelText: "Valid Thru",
                                    hintText: "****",
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: FMCvvField(
                                  onChanged: (value) {
                                    provider.getCardCode(code: value);
                                  },
                                  controller: cvv,
                                  cursorColor: const Color(0xFF49B7AE),
                                  decoration: InputDecoration(
                                    labelText: "CVV",
                                    hintText: "***",
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 35,
              ),
              child: MyButton(
                ontap: () {
                  userTappedPay();
                },
                text: 'Pay Now',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
