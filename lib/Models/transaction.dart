class Transaction {
  final id;
  final DateTime time;
  final double amount;
  final String coinid;
  final String senderAddress;
  final String reciverAddress;

  Transaction(
      {this.id,
      required this.time,
      required this.amount,
      required this.coinid,
      required this.senderAddress,
      required this.reciverAddress});
}
