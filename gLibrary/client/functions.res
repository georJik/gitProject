int	Player::Continue(playerid)
{
	mysql::format(handle, query, 70, "SELECT `Name` FROM `accounts` WHERE `Name` = '%s'", Name(playerid));
	return mysql::tquery(handle, query, "OnPlayerCheck", "i", playerid);
}

int Player::Check(playerid) 
{
	new rows, fields, string[140];
 	cache_get_data(rows, fields);
   	if(rows) 
	{
		format(string, 140, "{ffffff}Аккаунт под ником {82D3FB}%s {ffffff}найден в базе данных\n\
		Если вы являетесь его владельцем, {8CFB82}пожалуйста введите пароль", Name(playerid));
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, "{82D3FB}Вход в аккаунт", string, "Готово", "Выход");
  	}
  	else 
	{
		format(string, 140, "{ffffff}Аккаунт под ником {00C4FF}%s {ffffff}не найден в системе!\nЕсли вы желаете начать игру пожалуйста зарегистрируйтесь!", Name(playerid));
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_MSGBOX, "{00C4FF}Регистрация аккаунта", string, "Далее", "");
  	}
	return true;
}

int Player::LoadData(playerid)
{
	new rows, fields;
	cache_get_data(rows, fields);
	if(rows)
	{
		// Загрузка
		getString(Player[playerid][Password], "Password", 24);
		
		// Спавн
		Logged{playerid} = true;
		TogglePlayerSpectating(playerid, false);
		PlayerPlaySound(playerid, 21002, 0.0, 0.0, 0.0);
	}
	else 
	{
		if(GetPVarInt(playerid, "warning") == 2) return Kick(playerid);
		PlayerPlaySound(playerid, 21001, 0.0, 0.0, 0.0);
		SetPVarInt(playerid, "warning", GetPVarInt(playerid, "warning")+1);
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FB8282}Неверный пароль!", "{ffffff}Введенный вами пароль {FB8282}неверный!\n\nПожалуйста повторите", "Повтор", "Отмена");
		return true;
	}
	return true;
}

int Player::SaveData(playerid, bool:threaded)
{
	return true;
}

public Player::Connect(playerid)
{
	GetPlayerName(playerid, this[Name], MAX_PLAYER_NAME), GetPlayerIp(playerid, this[IP], 16);
	SetTimerEx("OnPlayerContinue", 1500, false, "i", playerid);
	return true;
}

public Player::Disconnect(playerid, reason)
{
	return true;
}

public Player::RequestClass(playerid, classid)
{
	return true;
}

public Player::RequestSpawn(playerid)
{
	return false;
}

public Player::Spawn(playerid)
{
	return true;
}

public Player::Death(playerid, killerid, reason)
{
	return true;
}

public Player::Text(playerid, text[])
{
	return false;
}

public Player::CommandText(playerid, cmdtext[])
{
	return false;
}

public Player::StateChange(playerid, newstate, oldstate)
{
	return true;
}

public Player::EnterCheckpoint(playerid)
{
	return true;
}

public Player::LeaveCheckpoint(playerid)
{
	return true;
}

public Player::EnterRaceCheckpoint(playerid)
{
	return true;
}

public Player::LeaveRaceCheckpoint(playerid)
{
	return true;
}

public OnRconCommand(cmd[])
{
	return true;
}

public OnObjectMoved(objectid)
{
	return true;
}

public Player::ObjectMoved(playerid, objectid)
{
	return true;
}

public Player::PickUpPickup(playerid, pickupid)
{
	return true;
}

public Player::SelectedMenuRow(playerid, row)
{
	return true;
}

public Player::ExitedMenu(playerid)
{
	return true;
}

public Player::InteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return true;
}

public Player::KeyStateChange(playerid, newkeys, oldkeys)
{
	return true;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return true;
}

public Player::Update(playerid)
{
	return true;
}

public Player::StreamIn(playerid, forplayerid)
{
	return true;
}

public Player::StreamOut(playerid, forplayerid)
{
	return true;
}

public Player::Dialog(playerid, dialogid, response, listitem, inputtext[])
{
	if(GetPVarInt(playerid, "dialogid") != dialogid) return true;
	SetPVarInt(playerid, "dialogid", _unx);
	new string[220]; // String для функции Player::Dialog
	switch(dialogid)
	{
		case DIALOG_LOGIN:
		{
			if(!response) return Kick(playerid);
			if(!strlen(inputtext)) 
			{
				format(string, 140, "{ffffff}Аккаунт под ником {82D3FB}%s {ffffff}найден в базе данных\n\
				Если вы являетесь его владельцем, {8CFB82}пожалуйста введите пароль", Name(playerid));
				ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{82D3FB}Вход в аккаунт", string, "Готово", "Выход");
				return true;
			}
			mysql_format(handle, query, 120, "SELECT * FROM `accounts` WHERE `Name` = '%s' AND `Password` = '%s'", Name(playerid), inputtext);
			mysql_tquery(handle, query, "OnPlayerLoadData", "i", playerid);
		}
		case DIALOG_REGISTER:
		{
			
		}
	}
	return true;
}

public Player::ClickPlayer(playerid, clickedplayerid, source) return true;

public Player::CommandReceived(playerid, cmdtext[]) return (!Logged{playerid}) ? false : true; 

public Player::CommandPerformed(playerid, cmdtext[], success) return true;