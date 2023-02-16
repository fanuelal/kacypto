class CryptoCoin {
  final String name;
  final String Currentprice;
  final DateTime time;
  CryptoCoin(this.name, this.Currentprice, this.time);
}

class EndLink {
  static final url = "https://rest.coinapi.io/v1/exchangerate/USD?apikey=A3C51467-76E3-4EF1-9F1F-D524B3E26F9F&invert=true&output_format=json";
}