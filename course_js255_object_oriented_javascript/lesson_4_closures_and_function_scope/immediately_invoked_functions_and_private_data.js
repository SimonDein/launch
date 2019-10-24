let inventory = (function () {
  let stocks = [];

  function isValid(newStock) {
    return stocks.every((stock) => stock.name !== newStock.name);
  }

  return {
    stockCounts: function() {
      stocks.forEach(function (stock) {
        console.log(`${stock.name}: ${stock.count}`);
      })
    },

    addStock: function(newStock) {
      if (isValid(newStock)) stocks.push(newStock);
    },
  }
})();

inventory.addStock(
  {name: 'ballpen', count: 3}
)
inventory.addStock(
  {name: 'ballpen', count: 3}
)
inventory.addStock(
  {name: 'office chair', count: 7}
)

inventory.stockCounts();
