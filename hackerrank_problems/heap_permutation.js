let swap = function(array, pos1, pos2) {
  let temp = array[pos1];
  array[pos1] = array[pos2];
  array[pos2] = temp;
};

let heapsPermute = function(array, output, n) {
  n = n || array.length; //set , default to array.length;
  if (n == 1) {
    output(array);
  } else {
    for (let i = 1; i <= n; i += 1) {
      heapsPermute(array, output, n -1);
      if (n % 2) {
        var j = 1;
      } else {
        var j = i;
      }
      swap(array, j - 1, n - 1); // - 1 to account for js zero-indexing
    }
  }
};

// for testing:
let print = function(input) {
  console.log(input);
};

heapsPermute(['a','b','c','d'], print);
// heapsPermute([1,2,1,2], print);
