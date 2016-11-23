
-- Global plugin object.
Plugin = nil

-- Initialize the plugin.
function Initialize(plugin)
  -- Setup configuration file.
  dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
  
  -- Configure plugin name and version.
  plugin:SetName(PLUGIN)
  plugin:SetVersion(VERSION)
  
  -- Set plugin to global.
  Plugin = plugin
  
  -- Load the configuration.
  accounts:load()
  
  -- Hooks
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_JOINED, OnPlayerJoined)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_DESTROYED, OnPlayerDestroyed)
  
  -- Register in-game commands.
  RegisterPluginInfoCommands()
  
  LOG("Initialized " .. PLUGIN .. " v." .. VERSION)
  
  f:log(f:amount(coin:global()) .. " total Coin in world.")
  return true
end

-- When the plugin is closing down save data.
function OnDisable()
  LOG("Closing " .. PLUGIN .. " v." .. VERSION)
  accounts:save()
end