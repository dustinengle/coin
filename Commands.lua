
--- Get the player balance and return amount.
function HandleBalance(args, player)
  local x = f:amount(accounts:balance(player:GetUUID()))
  player:SendMessageSuccess("Balance: " .. x)
  return true
end

--- Send another player amount provided.
function HandleSend(args, player)
  if #args < 4 then
    player:SendMessageFailure("Please provide the player name and amount.")
    return true
  end
  
  f:task(
    args[3], 
    function(to)
      -- If the same player then send failed message and return.
      if player:GetUUID() == to:GetUUID() then
        player:SendMessageFailure("You cannot send Coin to yourself.")
      -- Attempt to make a payment, will error if not enough funds.
      elseif coin:pay(player:GetUUID(), to:GetUUID(), tonumber(args[4])) then
        local a = f:amount(args[4])
        player:SendMessageSuccess("You sent " .. to.GetName() .. " " .. a .. ".")
        to:SendMessageSuccess("You received " .. a .. " from " .. player:GetName() .. ".")
      -- Handle not enough funds error message.
      else
        player:SendMessageFailure("You do not have enough Coin to send.")
      end
    end
  )
  
  return true
end