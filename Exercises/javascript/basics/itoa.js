
var DIGITS = ['0','1','2','3','4','5','6','7','8','9'];

function integerToString(integer) {
  var string = '';
  var rem = 0;
  while (integer) {
    rem = integer % 10;
    integer = Math.floor(integer / 10);
    string = DIGITS[rem] + string;
  }
  return string;
}

console.log(integerToString(123456789));
