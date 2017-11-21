

var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {
    console.log('Hello');
}

if (!myString) {
    console.log('World');
}

if (!!myArray) {
    console.log('World2');
}

//the interesting behavior is that myOtherString results in nontruthy, and myArray is truthy
if (myOtherString || myArray) {
    console.log('!');
}
