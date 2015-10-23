#define	OnPlayerDialog				OnDialogResponse			// Перенос функции в класс игрока
#define	Player::					OnPlayer 					// Пространство имен игрока
#define	Vehicle::					OnVehicle					// Пространство имен транспорт
#define	mysql::						mysql_						// Пространство имен MySQL
#define int%0(%1)					forward%0(%1);public%0(%1)	// Простой и полезный хук объявления функции
#define	Name(%0)					Player[%0][Name]			// Player[playerid][Name]	- Никнейм игрока
#define	Ip(%0)						Player[%0][IP]				// Player[playerid][IP]		- Текущий IP адрес игрока
#define	this[%0]					Player[playerid][%0]		// Быстрый доступ к элементу массива игрока ( playerid )

showPlayerDialog(playerid, dialogid, style, caption[], info[], button1[], button2[]) 
{ 
	SetPVarInt(playerid, "dialogid", dialogid); 
	return ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);  
}

#if	defined	_ALS_showPlayerDialog
	#undef	ShowPlayerDialog
#else
	#define	_ALS_ShowPlayerDialog
#endif
#define	ShowPlayerDialog	showPlayerDialog // Хук анти-вывода фейк диалогов

#define	DIALOG_LOGIN	1
#define	DIALOG_REGISTER	2