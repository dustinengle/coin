
g_PluginInfo = {
  Name = PLUGIN,
  Date = "2016-11-17",
  Description = "Simple currency system with API.",
  
  -- Information about plugin.
  AdditionalInfo = {
    {
      Title = PLUGIN .. "Plugin",
      Contents = "Simple currency system with account balance view and plugin API.",
    },
  },
  
  -- Plugin commands.
  Commands = {
    ["/coin"] = {
      Permission = "",
      HelpString = "Coin plugin commands.",
      Handler = nil,
      Subcommands = {
        balance = {
          HelpString = "View your account balance.",
          Permission = "",
          Handler = HandleBalance,
          ParameterCombinations = {},
        },
        send = {
          HelpString = "Send Coin to a player.",
          Permission = "",
          Handler = HandleSend,
          ParameterCombinations = {
            {
              Params = "player amount",
              Help = "Send amount of provided Coin to player.",
            },
          },
        },
      },
    },
  },
  
  -- TODO: Add console command for the server console.
  ConsoleCommands = {},
  
  -- Setup permissions
  Permissions = {},
}