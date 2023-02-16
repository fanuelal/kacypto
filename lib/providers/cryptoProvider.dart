import 'package:casypto/Models/crypto.dart';
import 'package:flutter/foundation.dart';


class Crypto extends ChangeNotifier {
  final List<CryptoCoin> coins = [];

  Future<void>? fetchandset() {
    
    notifyListeners();
    return this.coins as Future;
  }
}
