#define	OnPlayerDialog				OnDialogResponse			// ������� ������� � ����� ������
#define	Player::					OnPlayer 					// ������������ ���� ������
#define	Vehicle::					OnVehicle					// ������������ ���� ���������
#define	mysql::						mysql_						// ������������ ���� MySQL
#define int%0(%1)					forward%0(%1);public%0(%1)	// ������� � �������� ��� ���������� �������
#define	Name(%0)					Player[%0][Name]			// Player[playerid][Name]	- ������� ������
#define	Ip(%0)						Player[%0][IP]				// Player[playerid][IP]		- ������� IP ����� ������
#define	this[%0]					Player[playerid][%0]		// ������� ������ � �������� ������� ������ ( playerid )

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
#define	ShowPlayerDialog	showPlayerDialog // ��� ����-������ ���� ��������

#define	DIALOG_LOGIN	1
#define	DIALOG_REGISTER	2