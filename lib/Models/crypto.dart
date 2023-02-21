class CryptoCoin {
  final String id;
  final String name;
  final String symbol;
  final double  Currentprice;
  final String time;
  final String image;
  final double high_24h;
  final double low_24h;
  
  final double ath_change_percentage; 
  final double price_change_24h;

  CryptoCoin(
      {
      required this.id,
      required this.name,
      required this.symbol,
      required this.Currentprice,
      required this.time,
      required this.image,
      required this.high_24h,
      required this.low_24h,
      required this.ath_change_percentage,
      required this.price_change_24h});
}

class EndLink {
  static final url =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";
}
