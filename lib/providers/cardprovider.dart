import 'package:flutter/material.dart';

class Cardprovider extends ChangeNotifier {
  String _cardnumber = '';
  String _expirydate = '';
  String _holdername = '';
  String _cvvCode = '';

  String get cardNumber => _cardnumber;
  String get expiryDate => _expirydate;
  String get holderName => _holdername;
  String get cvvCode => _cvvCode;

  void getCardNumber({
    required String cardNumber,
  }) {
    _cardnumber = cardNumber;

    notifyListeners();
  }

  void getCardHolder({required String name}) {
    _holdername = name;
    notifyListeners();
  }

  void getExpirydate({required String expiry}) {
    _expirydate = expiry;
    notifyListeners();
  }

  void getCardCode({required String code}) {
    _cvvCode = code;
    notifyListeners();
  }
}
