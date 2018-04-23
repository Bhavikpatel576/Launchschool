
var DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};


function stringToInteger(s) {
  var result = 0;
  for (i = s.length - 1; i >= 0; i -= 1) {
    result = (10 * result) +  DIGITS[s[i]];
  }
  return result;
}

const s = "123456";
var value = stringToInteger(s);
console.log(value);


