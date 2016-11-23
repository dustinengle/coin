
--- Return the players balance.
function Balance(uuid)
  return f:amount(coin:balance(uuid))
end

--- Credit a player's account and return amount
-- with Coin symbol attached.
function Credit(uuid, amount)
  return f:amount(coin:credit(uuid, tonumber(amount)))
end

--- Debit a player's account and return amount
-- with Coin symbol attached.
function Debit(uuid, amount)
  return f:amount(coin:debit(uuid, tonumber(amount)))
end