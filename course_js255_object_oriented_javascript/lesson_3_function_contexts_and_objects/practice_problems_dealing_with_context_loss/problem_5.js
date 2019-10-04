// Use the var self = this fix to alter TESgames.listGames such that it logs our desired output to the console.

var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    let self = this;
    this.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
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