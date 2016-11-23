
-- When the player logs into the server
-- we want to setup the user in cache.
function OnPlayerJoined(player)
  accounts:check(player:GetUUID())
  return false -- Do not stop propagation.
end

-- When a player leaves save the ini file for
-- all players loaded in memory.
function OnPlayerDestroyed(player)
  accounts:save()
  return false -- Do not stop propagation.
end