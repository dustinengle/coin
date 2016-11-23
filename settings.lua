
--- settings
settings = {}
settings.Symbol = "$"

--- Load the ini file into memory.
function settings:load()
  local file = cIniFile()
  
  -- Try to read settings.ini file.
  if file:ReadFile(f:path() .. 'settings.ini') then
    f:log("Symbol: " .. file:GetValue("Coin", "Symbol"))
    self.Fee = file:GetValueSetF("Coin", "Fee", 0.1)
    self.Symbol = file:GetValueSet("Coin", "Symbol", "$")
    
    return true
  end
  
  return false
end

return settings