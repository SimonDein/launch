document.addEventListener('DOMContentLoaded', function (event) {
  var addButton = document.getElementById('add');
  var output = document.getElementById('output');
  var count = 0;

  addButton.addEventListener('click', function (event) {
    count += 1;
    output.textContent = String(count);
  });
});