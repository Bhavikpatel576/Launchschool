

var name = 'Bob';
var saveName = name;
name.toUpperCase();
console.log(name, saveName);


//explination - this is different from
//var name = 'bob
//var saveName = name
//name = 'alice'
//console.log(name, saveName)
//
//using the method toUpperCase does not result in a reassignment.
