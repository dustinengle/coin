
--- Coin
coin = {}

--- Get the balance.
function coin:balance(uuid)
  return f:amount(accounts:balance(uuid))
end

--- Credit player.
function coin:credit(uuid, amount)
  accounts:credit(uuid, amount)
  return amount
end

--- Debit a player.
function coin:debit(uuid, amount)
  -- We dont want negative balances.
  if accounts:has(uuid, amount) then
    accounts:debit(uuid, amount)
    return amount
  end
  
  return 0.00
end

--- Pay a player by making a debit to one
-- player's account and adding to another
-- player's account.  Will check balance
-- of 'from' account before making payment.
function coin:pay(from, to, amount)
  if accounts:has(from, amount) then
    accounts:debit(from, amount)
    accounts:credit(to, amount)
    return true
  end
  
  return false
end

--- Global Coin value in total.
-- Will sum up all accounts in the system.
function coin:global()
  local t = 0.00
  
  for _, v in pairs(accounts.players) do
    t = t + v
  end
  
  return t
end

return coin