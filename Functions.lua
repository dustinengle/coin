
--- Functions
f = {}

--- Get the amount with the symbol from
-- the settings Symbol value.
function f:amount(v)
  return settings.Symbol .. tostring(v)
end

--- Log a message to the console.
function f:log(msg)
  msg = msg or "EMPTY"
  LOG(PLUGIN .. ": " .. msg)
end

--- Get the plugin folder path.
function f:path()
  return cPluginManager:GetPluginsPath() .. "/" .. PLUGIN .. "/"
end

--- Queue a task for system to be ran when the
-- player has been found.
function f:task(name, callback)
  cRoot:Get():ForEachWorld(
    function(world)
      world:QueueTask(
        function(w)
          w:DoWithPlayer(name, callback)
        end
      )
    end
  )
end

return f