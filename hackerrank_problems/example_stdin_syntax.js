// function main() {
//     var n_temp = readLine().split(' ');
//     var n = parseInt(n_temp[0]);
//     var k = parseInt(n_temp[1]);
//     a = readLine().split(' ');
//     a = a.map(Number);
//
//     console.log(a);
// }


// This is also example to read the input
// process.stdin.resume();
// process.stdin.setEncoding("ascii");
// var input = "";
// process.stdin.on("data", function (chunk) {
//     input += chunk;
// });
// process.stdin.on("end", function () {
//     // now we can read/parse input
//         let test = input.split("\n");
//         console.log(test);
// });

// Result of above
// Input (stdin)
// 3
// 3
// 1 1 2
// 2
// 1 2
// 4
// 1 2 2 1
//
// Your Output (stdout)
// [ '3', '3', '1 1 2', '2', '1 2', '4', '1 2 2 1' ] //console.log(test)

process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

function birthdayCakeCandles(n, ar) {
    // Complete this function
        let max = 1;
    let count = 0;

    for (let i = 0; i < ar.length; i++) {
        if (ar[i] > max) {
            max = ar[i];
            count = 0; //reset count to 0 if you find a greater max number, this would be first sighting
        }
        if (ar[i] == max) {
            count += 1;
        }
    }

    return count;
}

function main() {
    var n = parseInt(readLine());
    ar = readLine().split(' ');
    ar = ar.map(Number);
    var result = birthdayCakeCandles(n, ar);
    process.stdout.write("" + result + "\n");

}


// Multiply string
// "abc".repeat(3)
// "abcabcabc"

// Array(11).join("a")
// "aaaaaaaaaa"
// 11 created 10 'a's


// for ruby
// To call functions directly on an object
//
// a = [2, 2, 3]
// a.send("length")
// or with arguments
// send("i_take_multiple_arguments", *[25.0,26.0]) #Where star is the "splat" operator
