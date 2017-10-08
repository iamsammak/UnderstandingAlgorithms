// Reverse Polish notation is a mathematical notation in which every operator follows all of it's operands.
//
// Implement a Reverse Polish Notation calculator, with the following operations:
// 
// : binary operator equivalent to  (e.g. )
// : unary operator equivalent to  (e.g. )
// : ternary operator equivalent to  (e.g. )
//
// All operations should be done on integers
//
// You should use the symbols + - * / x y z for the operators.

function rpn(operationString) {
    // even numbers in the string should be spaces
    // to be sure I can split into an array, but this would take up extra memory
    let arr = operationString.split(" ");
    let ret = [];
    for (let i = 0; i < arr.length; i++) {
      // operator
        if (!Number.isInteger(parseInt(arr[i]))) {
            let temp = operation(arr[i], ret);
            if (temp == "NO") {
              return "NO";
            }
            ret = [temp];
        } else if (Number.isInteger(parseInt(arr[i]))) {
            ret.push(parseInt(arr[i]));
        }
    }
    return ret[0];
}

function operation(operator, numArr) {
    let ret = "";
  switch(operator) {
    case "+":
      ret = numArr[0] + numArr[1];
      break;
    case "-":
      ret = numArr[0] - numArr[1];
      break;
    case "*":
      ret = numArr[0] * numArr[1];
      break;
    case "/":
      ret = numArr[0] / numArr[1];
      break;
    case "x":
      ret = Math.pow(numArr[0], 2) + numArr[1];
      break;
    case "y":
      ret = 2 * numArr[0] + 1;
      break;
    case "z":
      ret = numArr[0] + (2 * numArr[1]) + (3 * numArr[2]);
      break;
    default:
      return "NO";
  }
  return Math.floor(ret);
}

console.log("rpn", rpn("3 4 + 5 -"));
