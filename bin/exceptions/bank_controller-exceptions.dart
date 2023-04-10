class SenderIdInvalidException implements Exception {
  String idSender;
  SenderIdInvalidException({required this.idSender});
}

class ReceiverIdInvalidException implements Exception{
  String idReceiver;
  ReceiverIdInvalidException({required this.idReceiver});
}

class SenderNotAuthenticatedException implements Exception{
  String idSender;
  SenderNotAuthenticatedException({required this.idSender});
}

class SenderBalanceLowerThaAmountException implements Exception{
  String idSender;
  double senderBalance;
  double amount;
  SenderBalanceLowerThaAmountException({required this.idSender, required this.senderBalance, required this.amount});
}