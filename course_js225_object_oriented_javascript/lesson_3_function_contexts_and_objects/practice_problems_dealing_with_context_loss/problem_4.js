// Consider the code below, and our desired output:
// Will this code log our desired output? Why or why not?

var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();

// Desired output:

// The Elder Scrolls Arena
// The Elder Scrolls Daggerfall
// The Elder Scrolls Morrowind
// The Elder Scrolls Oblivion
// The Elder Scrolls Skyrim

/*
No it will not.
Inside the method we have access to the titles array passed to the callback, giving us each title.
But, inside the callback function we refer to this, and as we're inside a function, this will refer to the context
of the global object - not the TESgames object.

So we will print "undefined {title}" on each iteration.
*/