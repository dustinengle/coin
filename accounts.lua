
--- Accounts
accounts = {}

--- The list of players with accounts.
accounts.players = {}

--- Return the current balance for a player.
function accounts:balance(uuid)
  self:check(uuid)
  return self.players[uuid] or 0.00
end

--- Check if an account is in the system
-- if not then create it.  Will be saved on exit.
function accounts:check(uuid)
  if not self.players[uuid] then
    self.players[uuid] = 0.0
  end
end

--- Credit a user with provided amount.
function accounts:credit(uuid, amount)
  if amount > 0.0 then
    self:check(uuid)
    self.players[uuid] = self.players[uuid] + amount
  end
end

--- Debit a player's account for amount provided.
function accounts:debit(uuid, amount)
  if amount > 0.0 then
    self:check(uuid)
    self.players[uuid] = self.players[uuid] - amount
  end
end

--- Check that the player has amount provided.
function accounts:has(uuid, amount)
  self:check(uuid)
  return self.players[uuid] >= amount
end

--- Load the ini file into memory.
function accounts:load()
  local file = cIniFile()
  
  -- Try to read settings.ini file.
  if file:ReadFile(f:path() .. 'accounts.ini') then
    -- Loop over uuid keys.
    for k = 0, (file:GetNumKeys() - 1) do
      -- Get the name of the uuid of player.
      local uuid = file:GetKeyName(k)
      self.players[uuid] = file:GetValueSetI(uuid, "Balance")
    end
    
    return true
  end
  
  return false
end

--- Save player accounts to the ini file.
function accounts:save()
  local file = cIniFile()
  
  for uuid, balance in pairs(self.players) do
    file:AddKeyName(uuid)
    file:SetValueF(uuid, "Balance", balance, true)
  end
  
  if file:WriteFile(f:path() .. 'accounts.ini') then
    f:log("accounts.ini file saved.")
  else
    f:log("unable to save accounts.ini file.")
  end
end

return accounts