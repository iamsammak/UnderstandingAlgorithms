function memoize(func) {
  var cache = {};
  return function() {
    var key = JSON.stringify(arguments);
    if(cache[key]) {
      return cache[key];
    }
    else {
      var val = func.apply(this, arguments);
      cache[key] = val;
      return val;
    }
  };
}

// function factorial(num) {
//   if(num === 1) { return 1 };
//   return num * factorial(num - 1);
// }

var factorial = memoize(function(num) {
  console.log('working for factorial(' + num + ')');
  if(num === 1) { return 1 };
  return num * factorial(num - 1);
});

console.log("first call");
console.log(factorial(3));
// prints out below
// working for factorial(3)
// working for factorial(2)
// working for factorial(1)
// 6

console.log("successive calls");
console.log(factorial(3)); //=> 6
console.log(factorial(3)); //=> 6

console.log("short circuit higher factorial calls");
console.log(factorial(4));
//=> working for factorial(4)
//=> 24
