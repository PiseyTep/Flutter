class BankAccount {
  int accountId;
  String accountOwner;
  double balance;

  BankAccount(
      {required this.accountId, required this.accountOwner, this.balance = 0});

//function
  double getbalance() {
    return balance;
  }

  void credit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    if (balance - amount < 0) {
      throw Exception(
          ' $accountOwner Account \$${amount} is Insufficient balance for withdrawal! ');
    }
  }
}

class Bank {
  String name;
  List<BankAccount> accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in accounts) {
      if (account.accountId == accountId) {
        throw Exception(
            'Account my name: $accountOwner ID: $accountId already exists!!');
      }
    }

    var newAcc = BankAccount(accountId: accountId, accountOwner: accountOwner);
    accounts.add(newAcc);
    return newAcc;
  }
}

void main() {
  Bank myBank = Bank(name: "ACELEDA Bank");
  BankAccount myAccount = myBank.createAccount(001, 'Dalin');
  print(
      "Account ID : ${myAccount.accountId} \nName: ${myAccount.accountOwner}");
  print("Balance: \$${myAccount.balance}");
  myAccount.credit(100);
  print("Credit: \$${myAccount.balance}");
  myAccount.withdraw(50);
  print("Balance: \$${myAccount.balance}");

  try {
    myAccount.withdraw(1000); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(001, 'Jennie'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
