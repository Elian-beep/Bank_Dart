import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller-exceptions.dart';
import 'models/account.dart';

void main() {
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

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 599);
    // Observando resultado|
    if (result) {
      print("Transação concluída com sucesso");
    }
  } on SenderIdInvalidException catch (e) {
    print("O id ${e.idSender} do remetente não é um id válido");
  } on ReceiverIdInvalidException catch (e) {
    print("O id ${e.idReceiver} do destinatário não é um id válido");
  } on SenderNotAuthenticatedException catch (e) {
    print("o usuário remetente de id ${e.idSender} não esta autenticado");
  } on SenderBalanceLowerThaAmountException catch (e) {
    print("O usuário de id ${e.idSender} tentou enviar ${e.amount} sendo que na sua conta tem apenas ${e.senderBalance}");
  } on Exception {
    print("As coisas saíram do controle");
  }
}
