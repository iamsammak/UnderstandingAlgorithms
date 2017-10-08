# ruby
require "byebug"

def make_change(amt, coins, coin_cache = {0 => 0})
  return coin_cache[amt] if coin_cache[amt]
  coins = coins.sort
  return 0.0/0.0 if amt < coins[0]

  min_change = amt
  way_found = false
  idx = 0
  while idx < coins.length && coins[idx] <= amt
    byebug
    num_change = 1 + make_change(amt - coins[idx], coins, coin_cache)
    if num_change.is_a?(Integer)
      way_found = true
      min_change = num_change if num_change < min_change
    end
    idx += 1
  end

  if way_found
    coin_cache[amt] = min_change
  else
    coin_cache[amt] = 0.0/0.0
  end
end

# implicit return, returning min_change Or rather "coin_cache[amt]" to be exact
