// Make Change: write a function that takes in an amount and a set of coins.
// Return the minimum number of coins needed to make change for the given amount.
// You may assume you have an unlimited supply of each type of coin.
// If it's not possible to make change for a given amount, return nil or NaN.

function makeChange(amount, coins, coinCache) {
  coinCache = coinCache || {0:0};
  if (amount in coinCache) {
    return coinCache[amount];
    // console.log("found in stored in cache",coinCache);
  }
  coins.sort(function(a,b){return a-b});
  // console.log("sort", coins.sort(function(a,b){return a-b}));
  if (amount < coins[0]) {
    return 0.0/0.0; //NaN
  }
  let minNumOfCoins = amount;
  let wayFound = false;
  let idx = 0;

  while (idx < coins.length && coins[idx] <= amount) {
    let numOfCoins = 1 + makeChange(amount - coins[idx], coins, coinCache);
    //the one represents current coin
    // console.log("numOfCoins", numOfCoins);
    // console.log("hi", Number.isInteger(numOfCoins));
    if (Number.isInteger(numOfCoins)) {
      wayFound = true;
      if (numOfCoins < minNumOfCoins) {
        minNumOfCoins = numOfCoins
      }
    }
    idx += 1;
  }

  if (wayFound) {
    coinCache[amount] = minNumOfCoins;
    // console.log("new subproblem complete, adding to cache", coinCache);
  } else {
    // console.log("unable to use available coins to make this amount")
    coinCache[amount] = 0.0/0.0;
  }

  return coinCache[amount];
}

console.log("result", makeChange(1,[1]));
console.log("result", makeChange(14,[6]));
console.log("makeChange(14, [10,7,1])", makeChange(14, [10,7,1]));
