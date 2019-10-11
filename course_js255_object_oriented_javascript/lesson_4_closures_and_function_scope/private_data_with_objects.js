// ============ No private data ============
function makeList() {
  return {
    items: [],                    // not private!!!
    add: function(item) {
      this.items.push(item);
      console.log(item + ' added!')
    },

    remove: function(item) {
      let itemIndex = this.items.indexOf(item);
      if (itemIndex === -1) {
        console.log("You don't have " + item + " on the list.")
      } else {
        this.items.splice(itemIndex, 1);
        console.log(item + ' removed!')
      }
    },

    list: function() {
      if (this.items.length === 0) {
        console.log("List empty");
        return;
      }
      
      this.items.forEach((item) => console.log(item));
    },
  };
}

list = makeList();
list.list();
list.add('Bananas');
list.add('Bread');
list.list();
list.remove('Bananas');
list.remove('Terminator');

// But now we can access the items property, which was private before
console.log(list.items); // ['Bread']


// ============ With private data ============
function makeListWithPrivateData() {
  items = [];                    // private
  return {
    add: function(item) {
      items.push(item);
      console.log(item + ' added!')
    },

    remove: function(item) {
      let itemIndex = items.indexOf(item);
      if (itemIndex === -1) {
        console.log("You don't have " + item + " on the list.")
      } else {
        items.splice(itemIndex, 1);
        console.log(item + ' removed!')
      }
    },

    list: function() {
      if (items.length === 0) {
        console.log("List empty");
        return;
      }
      
      items.forEach((item) => console.log(item));
    },
  };
}

list = makeListWithPrivateData();
list.list();
list.add('Bananas');
list.add('Bread');
list.list();
list.remove('Bananas');
list.remove('Terminator');

console.log(list.items) // undefined