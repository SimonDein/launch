// Extend the code from the previous problem with a stopCounting function that stops the logger when called.

function startCounting() {
  let count = 1;
  let to = setInterval(() => {
    console.log(count);
    count += 1;
    if (count > 10) stopCounting(to);
  }, 1000)
}

function stopCounting(counterIdentifier) {
  clearInterval(counterIdentifier);
}

startCounting();