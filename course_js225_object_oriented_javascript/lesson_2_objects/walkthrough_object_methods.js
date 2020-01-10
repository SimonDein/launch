let me = {
  firstName: 'Simon',
  lastName: 'Dein',
};

let mother = {
  firstName: 'Henriette',
  lastName: 'Dein',
};

let father = {
  firstName: 'Bjarne',
  lastName: 'Dein',
};

let brother = {
  firstName: 'Philip',
  lastName: 'Dein',
};

let people = {
  collection: [brother, mother, father, me],

  fullName: function(person) {
    console.log(`${person.firstName} ${person.lastName}`);
  },

  rollCall: function() {
    this.collection.forEach(this.fullName);
  },

  add: function(person) {
    this.collection.push(person);
  },

  getIndex: function(person) {
    let comparator;
    for(let i = 0; i < this.collection.length; i += 1) {
      comparator = this.collection[i];
      if (person.firstName === comparator.firstName &&
          person.lastName === comparator.lastName) {
        return i;
      }
    }
    return -1;
  },
  
  remove: function(person) {
    if (this.isInvalidPerson(person)) return
    let index = this.getIndex(person);
    if (index === -1) return;
    this.collection.splice(index, 1);
  },

  isInvalidPerson: function (person) {
    return typeof(person.firstName) !== 'string' && typeof(person.lastName) !== 'string';
  },

  get: function(person) {
    if (this.isInvalidPerson(person)) return;
    let index = this.getIndex(person);
    let foundPerson = this.collection[index]
    return foundPerson;
  },

  update: function(person) {
    if (this.isInvalidPerson(person)) return;
    let index = this.getIndex(person);
    this.collection[index] = person;
  }
}

people.rollCall()

let friend = {firstName: 'Kim', lastName: 'Sandstrøm'};
people.add(friend);

people.rollCall();

people.remove(me)
people.rollCall();
people.remove({firstName: 42, lastName: 'Doe'});

people.get(brother);
people.get('dfsd');