document.addEventListener('DOMContentLoaded', (e) => {
  let btn = document.getElementById('submit');
  
  btn.onclick = (a) => {
    let message = document.getElementById('message').value;
    alert(message)
  };
});