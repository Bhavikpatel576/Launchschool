
var DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};


function stringToInteger(s) {
  var result = 0;
  var length = s.length - 1;
  for (i = length; i >= 0; i -= 1) {
    result = (10 * result) + DIGITS[s[i]];
  }
  return result;
}

function stringToSignedInteger(s) {
  switch (s[0]) {
    case '-': return -stringToInteger(s.slice(1));
    case '+': return stringToInteger(s.slice(1));
    default: return stringToInteger(s);
  }
}
const s1 = "-123456";
var value1 = stringToSignedInteger(s1);
console.log(value1);
const s = "123456";
var value = stringToInteger(s);
console.log(value);


