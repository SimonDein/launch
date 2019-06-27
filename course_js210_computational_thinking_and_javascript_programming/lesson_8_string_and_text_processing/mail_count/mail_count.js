// The objective of this practice problem is to build a function that parses a string of email data. The function takes an argument that contains the data, parses it, then produces two basic statistics about the email:

// The number of email messages found in the string
// The date range of the email messages
// The email messages string has the following characteristics:

// The string contains multiple email messages separated by the delimiter string ##||##.

// Each email message has five parts. The delimiter string #/# separates the parts.

// The five parts are:

// Sender
// Subject
// Date
// Recipient
// Body
// All five parts occur in the sequence shown above.

function stringToDateObject(dateString) {
  let [month, day, year] = dateString.split('-')
  return new Date(year, month, day);
}

function earliestDate(earliestDate, date) {
  return earliestDate < date ? earliestDate : date;
}

function latestDate(latestDate, date) {
  return latestDate > date ? latestDate : date;
}

function formatDate(date) {
  return date.toString().slice(0, 15);
}

function mailCount(emailData) {
  let emailMetaDataRegex = /^From:.+\nSubject:.+\nDate:.+\nTo:.+/gm;
  let emailDateRegex = /\b\d{2}-\d{2}-\d{4}/gm;

  let emailMetaData = emailData.match(emailMetaDataRegex);
  let emailDates = emailData.match(emailDateRegex).map(stringToDateObject);
  let firstEmailDate = emailDates.reduce(earliestDate)
  let lastEmailDate = emailDates.reduce(latestDate)

  console.log(`Count of Email: ${emailMetaData.length}`)
  console.log(`Date Range: ${firstEmailDate.toDateString()} - ${lastEmailDate.toDateString()}`)
}

mailCount(emailData)

// console output

// Count of Email: 5
// Date Range: Sat Jun 25 2016 - Thu Aug 11 2016