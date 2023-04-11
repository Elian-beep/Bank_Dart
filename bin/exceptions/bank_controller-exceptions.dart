class SenderIdInvalidException implements Exception {
  static const String report = "SenderIdInvalidException";
  String idSender;
  SenderIdInvalidException({required this.idSender});

  @override
  String toString() {
    return "$report\nID Sender: $idSender\n";
  }
}

class ReceiverIdInvalidException implements Exception{
  static const String report = "ReceiverIdInvalidException";
  String idReceiver;
  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString() {
    return "$report\nID Receiver: $idReceiver\n";
  }
}

class SenderNotAuthenticatedException implements Exception{
  static const String report = "SenderNotAuthenticatedException";
  String idSender;
  SenderNotAuthenticatedException({required this.idSender});

  @override
  String toString() {
    return "$report\nID Sender: $idSender\n";
  }
}

class SenderBalanceLowerThaAmountException implements Exception{
  static const String report = "SenderBalanceLowerThaAmountException";
  String idSender;
  double senderBalance;
  double amount;
  SenderBalanceLowerThaAmountException({required this.idSender, required this.senderBalance, required this.amount});
  @override
  String toString() {
    return "$report\nID Sender: $idSender\nSender Balance: $senderBalance\nAmout: $amount";
  }
}