// We do a parse but try take care of any error that might get thrown.

let parseJSON = function parseJSON(json) {
  try {
    result = JSON.parse(json)
  } catch (error) {
    console.log(`There was an ${error.name} parsing the data: ${error.message}`);
    result = null;
  } finally {
    console.log('Finished parsing data.');
  }

  return result;
}

var data = 'not valid JSON';
parseJSON(data);