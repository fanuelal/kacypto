import 'package:flutter/material.dart';
import '../Models/transaction.dart';

class Transactions with ChangeNotifier{
  List<Transaction> _transactions = [];
  List<Transaction> get transactions{
    return [..._transactions];
  }
  Future<void> addTransaction() async{

  }
}
