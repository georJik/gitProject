#tryinclude "../gLibrary/includes.res"
#if !defined	gIncluded
	#error 'gLibrary' don't included
#endif

/*

	Gamemode разделен на библиотеки
	Предусматриваются пространства имен для точности
	
		Игрок 				- Player::
		Библиотека игрока	- Client::
		Транспорт:			- Vehicle::

*/

/*

	Подключение необходимых:
	
		Макросов,
		Переменных и констант,
		Команд,
		
		Функций части игрока,
		Функций части сервера,
		Функций части транспорта

*/

#include "../gLibrary/server/macrosses.res"	// Подключение библиотеки -> макросы
#include "../gLibrary/server/variables.res"	// Подключение библиотеки -> глобальные переменные и константы
#include "../gLibrary/client/commands.res"	// Подключение библиотеки -> команды игрока

#include "../gLibrary/client/functions.res"	// Подключение библиотеки -> игрок
#include "../gLibrary/server/functions.res"	// Подключение библиотеки -> сервер
#include "../gLibrary/server/vehicle.res"	// Подключение библиотеки -> транспорт