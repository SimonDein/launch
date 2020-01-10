function makeBank() {
  let lastAccountNumber = 100;
  let accounts = [];
  return {

    openAccount: function() {
      let accountNumber = this.generateAccountNumber();
      let account = makeAccount(accountNumber);
      accounts.push(account);
      return account;
    },

    transfer: function(source, destination, amount) {
      destination.deposit(source.withdraw(amount));
    },

    generateAccountNumber: function() {
      return lastAccountNumber += 1;
    }
  }
}

function makeAccount(number) {
  let balance = 0;
  let transactions = [];
  
  return {
    deposit: function(amount) {
      balance += amount
      this.addTransaction('deposit', amount)
      return amount;
    },
    
    withdraw: function(amount) {
      trueAmount = amount > balance ? balance : amount; // We can't withdraw amount > balance
      balance -= trueAmount;
      this.addTransaction('withdraw', amount)
      return trueAmount;
    },
  
    addTransaction: function(type, amount) {
      transactions.push({type: type, amount: amount});
    },

    number: function() {
      return number;
    },

    balance: function() {
      return balance;
    },

    transactions: function() {
      return transactions;
    },
  }
}

let bank = makeBank();
let account = bank.openAccount()
account.deposit(35);

// We can only access the accountNumber, balance and transacttions through their methods
console.log(account.number())
console.log(account.balance())
console.log(account.transactions())

let anotherAccount = bank.openAccount();
// Money transfer
bank.transfer(account, anotherAccount, 12);
console.log(anotherAccount.balance());
console.log(account.balance());

// can't access the banks accounts
console.log(bank.accounts)

//{ balance: 0,
// transactions: [],
// deposit: [Function: deposit],
// withdraw: [Function: withdraw],
// addTransaction: [Function: addTransaction],
// number: 101 }

