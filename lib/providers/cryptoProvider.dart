import 'package:casypto/Models/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/crypto.dart';

class Crypto extends ChangeNotifier {
  final List<CryptoCoin> _coins = [];
  final coinCapUrl = Uri.parse(EndLink.url);
  List<CryptoCoin> get coins {
    return [..._coins];
  }

  // final swapUrl =
  //     "https://api.simpleswap.io/get_currency?api_key=SW17W3nc4&symbol=btc";
  Future<void> fetchandset() async {
    try {
      final response = await http.get(coinCapUrl);
      final fetchedData = json.decode(response.body) as List<dynamic>;
      fetchedData.forEach((coin) {
        _coins.add(
          CryptoCoin(
            id: coin['id'],
            name: coin['name'],
            symbol: coin['symbol'],
            Currentprice: coin['current_price'].toDouble(),
            time: coin['atl_date'],
            image: coin['image'],
            high_24h: coin['high_24h'].toDouble(),
            low_24h: coin['low_24h'].toDouble(),
            ath_change_percentage: coin['ath_change_percentage'].toDouble(),
            price_change_24h: coin['price_change_24h'].toDouble()));
      });

      print(_coins[0]);
      notifyListeners();
    } catch (e) {
      print(e);
      // throw e;
    }
  }
}
