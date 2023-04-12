import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller-exceptions.dart';
import 'models/account.dart';

void testingNullSafety(){
  Account? myAccount = Account(name: "Elian", balance: 200, isAuthenticated: true);

  //Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }

  //TESTE FORÇADO QUE NÃO FUNCIONA
  // print(myAccount.balance);
  // print(myAccount!.balance);
  // SAFE CALL
  // print(myAccount?.balance);
  // if (myAccount != null) {
  //   print(myAccount.balance);
  // }else{
  //   print("Conta nula");
  // }

  print(myAccount != null ? myAccount.balance : "Conta nula");
  print(myAccount.createdAt);
  // print(myAccount.createdAt!.day);
  print(myAccount.createdAt != null ? myAccount.createdAt!.day : "Conta não foi finalizada!");
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

      // Account accounttest = Account(name: "", balance: 200, isAuthenticated: true);

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 500);
    // Observando resultado|
    if (result) {
      print("Transação concluída com sucesso");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O id ${e.idSender} do remetente não é um id válido");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O id ${e.idReceiver} do destinatário não é um id válido");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("o usuário remetente de id ${e.idSender} não esta autenticado");
  } on SenderBalanceLowerThaAmountException catch (e) {
    print(e);
    print("O usuário de id ${e.idSender} tentou enviar ${e.amount} sendo que na sua conta tem apenas ${e.senderBalance}");
  } on Exception {
    print("As coisas saíram do controle");
  }
}
