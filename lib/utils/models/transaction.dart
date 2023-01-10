class Transaction {
  double? transactionPrice;
  String? transactionDatetime;
  int? transactionType;

  Transaction(
      {this.transactionPrice, this.transactionDatetime, this.transactionType});

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionPrice = json['transaction_price'];
    transactionDatetime = json['transaction_datetime'];
    transactionType = json['transaction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['transaction_price'] = transactionPrice;
    data['transaction_datetime'] = transactionDatetime;
    data['transaction_type'] = transactionType;
    return data;
  }
}