/* Server Components */

main();

public OnGameModeInit()
{
	SetGameModeText("git Project");
	handle = mysql::connect("localhost", "root", "gitProject", "");
	return true;
}

public OnGameModeExit()
{
	return mysql_close();
}

getInt(&var, field[], i = 0) return var = cache_get_field_content_int(i, field, handle);
getString(var[], field[], len = 48, i = 0) 
{
	new dynamic_string[48];
	cache_get_field_content(i, field, dynamic_string, handle, len);
	return strmid(var, dynamic_string, 0, strlen(dynamic_string), len);
}

getFloat(&Float:var, field[], i = 0) 
{
	new dynamic_string[16];
	cache_get_field_content(i, field, dynamic_string, handle);
	var = floatstr(dynamic_string);
}