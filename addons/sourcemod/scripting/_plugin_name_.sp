/**
 * vim: set ts=4 :
 * =============================================================================
 * _plugin_name_
 * TODO: Describe this plugin
 *
 * Copyright _the_year_ _your_name_
 * =============================================================================
 *
 */

#pragma semicolon 1

#include <sourcemod>
#include <_your_plugin_>

#define PLUGIN_VERSION "0.1"
#define PLUGIN_NAME "_plugin_name_"

public Plugin:myinfo =
{
    name = PLUGIN_NAME,
    author = "_your_name_",
    description = "TODO: description",
    version = PLUGIN_VERSION,
    url = "https://github.com/_your_name_/_plugin_name_"
};


new Handle:g_Cvar_Enabled = INVALID_HANDLE;

public APLRes:AskPluginLoad2(Handle:myself, bool:late, String:error[], err_max)
{
    if (LibraryExists("_plugin_name_"))
    {
        strcopy(error, err_max, "_plugin_name_ already loaded, aborting.");
        return APLRes_Failure;
    }

    RegPluginLibrary("_plugin_name_"); 

    return APLRes_Success;
}

public OnPluginStart()
{
    LoadTranslations("_plugin_name_.phrases");

    CreateConVar("sm__plugin_name__version", PLUGIN_VERSION, PLUGIN_NAME, FCVAR_PLUGIN | FCVAR_SPONLY | FCVAR_REPLICATED | FCVAR_NOTIFY | FCVAR_DONTRECORD);
    g_Cvar_Enabled = CreateConVar("sm__plugin_name__enabled", "1", "Enabled");

    RegConsoleCmd("sm_test", Command_Test, "TODO: TEST");

    AutoExecConfig();
}

public Action:Command_Test(client, args)
{
    return Plugin_Handled;
}
