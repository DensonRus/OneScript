﻿Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ВызовМетодаБезПараметров");
	ВсеТесты.Добавить("ТестДолжен_ВызовМетодаБезПараметров_ЯвноПередаюПустойМассив");
	
	Возврат ВсеТесты;
КонецФункции

Процедура ТестДолжен_ВызовМетодаБезПараметров() Экспорт
	ПодключитьСценарий("example-test.os", "Пример");
	Пример = Новый Пример();
	
	ИмяМетода = "Версия";
	Рефлектор = Новый Рефлектор;
	Версия = Рефлектор.ВызватьМетод(Пример, ИмяМетода);

	юТест.ПроверитьРавенство(Пример.Версия(), Версия);
КонецПроцедуры

Процедура ТестДолжен_ВызовМетодаБезПараметров_ЯвноПередаюПустойМассив() Экспорт
	ПодключитьСценарий("example-test.os", "Пример2");
	Пример = Новый Пример2();
	
	ИмяМетода = "Версия";
	ПустойМассив = Новый Массив;
	Рефлектор = Новый Рефлектор;
	Версия = Рефлектор.ВызватьМетод(Пример, ИмяМетода, ПустойМассив);

	юТест.ПроверитьРавенство(Пример.Версия(), Версия);
КонецПроцедуры