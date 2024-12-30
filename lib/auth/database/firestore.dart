import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/utils.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrdertoDatabase(BuildContext context, String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
    }).then(
      (value) {
        Utils.showBar(context, message: 'Ordered Successfully');
      },
    ).onError(
      (error, stackTrace) {
        Utils.showBar(
          context,
          message: error.toString(),
        );
      },
    );
  }
}
