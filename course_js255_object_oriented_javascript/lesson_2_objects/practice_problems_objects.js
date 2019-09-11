let invoices = {
  unpaid: [],
  paid: [],

  add: function(name, amount) {
    let invoice = {name: name, amount: amount};
    this.unpaid.push(invoice);
  },

  totalDue: function() {
    return this.unpaid.reduce(function (total, invoice) {
      return total += invoice.amount;
    }, 0);
  },
  
  totalPaid: function() {
    return this.paid.reduce(function (total, invoice) {
      return total += invoice.amount;
    }, 0);
  },

  payInvoice: function(name) {
    let unpaid = [];

    for(let i = 0; i < this.unpaid.length; i += 1) {
      let currentInvoice = this.unpaid[i];
      
      if (currentInvoice.name === name) {
        this.paid.push(currentInvoice);
      } else {
        unpaid.push(currentInvoice);
      }
    }

    this.unpaid = unpaid;
  }
}
invoices.add('Due North Development', 250)
invoices.add('Moonbeam Interactive', 187.50)
invoices.add('Slough Digital', 300)

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');

console.log(invoices.totalDue());
console.log(invoices.totalPaid());