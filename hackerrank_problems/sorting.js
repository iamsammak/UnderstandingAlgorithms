// bubbleSort
Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i=0; i < this.length-1; i++) {
      if (this[i] > this[i + 1]) {
        let temp = this[i];
        this[i] = this[i + 1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

// console.log("bubblesort", [5,4,3,2,1].bubbleSort());

// mergeSort
function mergeSort(array) {
  if (array.length < 2) {
    return array;
  } else {
    let middle = Math.floor(array.length / 2);
    let left = mergeSort(array.slice(0, middle));
    let right = mergeSort(array.slice(middle));

    return merge(left, right);
  }
}

function merge(left, right) {
  const merged = [];
  while (left.length > 0 && right.length > 0) {
    let nextItem = (left[0] < right[0]) ? left.shift() : right.shift();
    merged.push(nextItem);
  }

  return merged.concat(left, right);
}

// console.log("mergesort", mergeSort([10, 9, 8, 7, 6]));

//quickSort
Array.prototype.quickSort = function(comparator) {

};

// console.log([15,14,13,12,11].quickSort());

//bsearch
function bsearch(array, target) {
}

// console.log(bsearch([1,2,3,4,5], 5));
// console.log(bsearch([1,2,3,4,5], 1));
// console.log(bsearch([1], 3));

//subsets
function subsets(array) {
  if (array.length === 0) {
    return [[]];
  }

  const firstElement = array[0];
  const subSubsets = subsets(array.slice(1));

  const newSubsets =
    subSubsets.map(subSubset => [firstElement].concat(subSubset) );

  return subSubsets.concat(newSubsets);
}

console.log("subsets", subsets([1,3,5]));

let permArr = [];
let usedChars = [];

function permutations(array) {

  let i, ch;
  for (i=0;i < array.length; i++) {
    ch = array.splice(i, 1)[0];
    usedChars.push(ch);
    if (array.length == 0) {
      permArr.push(usedChars.slice());
    }
    permutations(array);
    array.splice(i, 0, ch);
    usedChars.pop();
  }

  return permArr;
}

console.log("permutations", permutations([1,2,3]));

function permutator(inputArr) {
  debugger
  var results = [];

  function permute(arr, memo) {
    debugger
    var cur, memo = memo || [];

    for (var i = 0; i < arr.length; i++) {
      cur = arr.splice(i, 1);
      if (arr.length === 0) {
        results.push(memo.concat(cur));
      }
      permute(arr.slice(), memo.concat(cur));
      arr.splice(i, 0, cur[0]);
    }

    return results;
  }

  return permute(inputArr);
}

console.log("permutator", permutator([5,3,7,1]));

function factorial(n) {
  if (n === 0) {
    return 1;
  }

  return n * factorial(n-1);
}

Function.prototype.curry = function(numOfArgs) {
};
//

function genCharArray(charA, charZ) {
}

// console.log(genCharArray('a', 'z'));

function jumbleSort(string, alphabet = null) {
}

// console.log(jumbleSort("hello"));
// console.log(jumbleSort("hello", ['o', 'l', 'h', 'e']));
