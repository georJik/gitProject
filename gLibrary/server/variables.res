#undef	MAX_PLAYERS
const
	MAX_PLAYERS 	= 10,
	MAX_QUERY_LEN 	= 480,
	_unx			= 0;

enum playerStruct
{
	Name[MAX_PLAYER_NAME], Password[24], IP[16]
}

new
	Player[MAX_PLAYERS][playerStruct],
	Logged[MAX_PLAYERS char];

new
	handle, // mysql handle
	query[MAX_QUERY_LEN]; // MySQL query string