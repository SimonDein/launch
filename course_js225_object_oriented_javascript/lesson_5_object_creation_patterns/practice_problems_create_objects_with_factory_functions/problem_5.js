// Update your createInvoice function to make it possible to add payment(s) to invoices. Use the code below as a guideline:

function createInvoice(services) {
  services = services || {};
  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    payments: [],

    total: function() {
      return this.phone + this.internet;
    },

    addPayment: function (payment) {
      this.payments.push(payment);
    },

    addPayments: function (payments) {
      payments.forEach((payment) => this.addPayment(payment));
    },

    amountDue: function () {
      return this.total() - this.payments.reduce((sum, payment) => sum + payment.total(), 0);
    }
  }
}

function createPayment(services) {
  services = services || {};
  return {
    internet: services.internet || 0,
    phone: services.phone || 0,
    amount: services.amount || 0,
    total: function () {
      if (this.amount > 0) return this.amount;
      return this.internet + this.phone
    }
  }
}

var invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

var payment1 = createPayment({
  amount: 2000,
});

var payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

var payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
console.log(invoice.amountDue());       // this should return 0
