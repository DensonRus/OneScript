﻿
Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_СоздатьОбъектРегулярноеВыражение");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьМетодСовпадает");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьМетодНайтиСовпадения");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеВложенныхГрупп");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСвойство_ИгнорироватьРегистр");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСвойство_Многострочный");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьМетодРазделить");
	
	Возврат ВсеТесты;
КонецФункции

Процедура ТестДолжен_СоздатьОбъектРегулярноеВыражение() Экспорт
	РегулярноеВыражение = Новый РегулярноеВыражение("a");

	юТест.ПроверитьРавенство(Строка(Тип(РегулярноеВыражение)), "РегулярноеВыражение", "Тип(""РегулярноеВыражение"") = ""РегулярноеВыражение""");
КонецПроцедуры

Процедура ТестДолжен_ПроверитьМетодСовпадает() Экспорт
	РегулярноеВыражение = Новый РегулярноеВыражение("a");
	Совпало = РегулярноеВыражение.Совпадает("a");
	юТест.Проверить(Совпало, "Совпало");

	РегулярноеВыражение = Новый РегулярноеВыражение("\d\d");
	Совпало = РегулярноеВыражение.Совпадает("15");
	юТест.Проверить(Совпало, "Совпало 15");

	Совпало = РегулярноеВыражение.Совпадает("q");
	юТест.ПроверитьЛожь(Совпало, "Не Совпало q");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСвойство_ИгнорироватьРегистр() Экспорт
	ИсходнаяСтрока = "s";
	
	РегулярноеВыражение = Новый РегулярноеВыражение(ВРег(ИсходнаяСтрока));
	юТест.Проверить(РегулярноеВыражение.ИгнорироватьРегистр, "РегулярноеВыражение.ИгнорироватьРегистр");
	Совпало = РегулярноеВыражение.Совпадает(ИсходнаяСтрока);
	юТест.Проверить(Совпало, "Совпало");

	РегулярноеВыражение.ИгнорироватьРегистр = Ложь;
	юТест.ПроверитьЛожь(РегулярноеВыражение.ИгнорироватьРегистр, "РегулярноеВыражение.ИгнорироватьРегистр ложь");

	Совпало = РегулярноеВыражение.Совпадает(ИсходнаяСтрока);
	юТест.ПроверитьЛожь(Совпало, "Совпало");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьСвойство_Многострочный() Экспорт
	ИсходнаяСтрока = "S"+Символы.ПС+"s";

	РегулярноеВыражение = Новый РегулярноеВыражение("^S");
	юТест.Проверить(РегулярноеВыражение.Многострочный, "РегулярноеВыражение.Многострочный");

	КоллекцияСовпадений = РегулярноеВыражение.НайтиСовпадения(ИсходнаяСтрока);
	юТест.ПроверитьРавенство(2, КоллекцияСовпадений.Количество(), "КоллекцияСовпадений.Количество()");

	РегулярноеВыражение.Многострочный = Ложь;
	юТест.ПроверитьЛожь(РегулярноеВыражение.Многострочный, "РегулярноеВыражение.Многострочный ложь");

	КоллекцияСовпадений = РегулярноеВыражение.НайтиСовпадения(ИсходнаяСтрока);
	юТест.ПроверитьРавенство(1, КоллекцияСовпадений.Количество(), "КоллекцияСовпадений.Количество() Многострочный ложь");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьМетодНайтиСовпадения() Экспорт
	ИсходнаяСтрока = "456";
	РегулярноеВыражение = Новый РегулярноеВыражение("\d\d\d");
	КоллекцияСовпадений = РегулярноеВыражение.НайтиСовпадения("s" + ИсходнаяСтрока);
	юТест.ПроверитьРавенство(Строка(Тип(КоллекцияСовпадений)), "КоллекцияСовпаденийРегулярногоВыражения", "Тип(""КоллекцияСовпадений"") = ""КоллекцияСовпаденийРегулярногоВыражения""");
	юТест.ПроверитьРавенство(1, КоллекцияСовпадений.Количество(), "КоллекцияСовпадений.Количество()");

	Совпадение0 = КоллекцияСовпадений[0];
	
	юТест.ПроверитьРавенство(Строка(Тип(Совпадение0)), "СовпадениеРегулярногоВыражения", "Тип(""Совпадение0"") = ""СовпадениеРегулярногоВыражения""");
	УбедитьсяЧтоНашлиНужнуюСтроку(ИсходнаяСтрока, Совпадение0, "Совпадение0");

	УбедитьсяЧтоОбходКоллекцииРаботаетВерно(КоллекцияСовпадений, Совпадение0, "Совпадение");
КонецПроцедуры


Процедура ТестДолжен_ПроверитьПолучениеВложенныхГрупп() Экспорт
	ИсходнаяСтрока = "456";
	РегулярноеВыражение = Новый РегулярноеВыражение("(\d)(\d\d)");
	КоллекцияСовпадений = РегулярноеВыражение.НайтиСовпадения("s" + ИсходнаяСтрока);

	Совпадение0 = КоллекцияСовпадений[0];
	КоллекцияГрупп = Совпадение0.Группы;

	юТест.ПроверитьРавенство(Строка(Тип(КоллекцияГрупп)), "КоллекцияГруппРегулярногоВыражения", "Тип(""КоллекцияГрупп"") = ""КоллекцияГруппРегулярногоВыражения""");
	юТест.ПроверитьРавенство(3, КоллекцияГрупп.Количество(), "КоллекцияГрупп.Количество()");
	
	Группа0 = КоллекцияГрупп[0];
	юТест.ПроверитьРавенство(Строка(Тип(Группа0)), "ГруппаРегулярногоВыражения", "Тип(""Группа0"") = ""ГруппаРегулярногоВыражения""");
	УбедитьсяЧтоНашлиНужнуюСтроку(ИсходнаяСтрока, Группа0, "Группа0");
	
	Группа1 = КоллекцияГрупп[1];
	юТест.ПроверитьРавенство("4", Группа1.Значение, "Группа1.Значение");
	юТест.ПроверитьРавенство(1, Группа1.Длина, "Группа1.Длина");
	юТест.ПроверитьРавенство(1, Группа1.Индекс, "Группа1.Индекс");
	
	Группа2 = КоллекцияГрупп[2];
	юТест.ПроверитьРавенство("56", Группа2.Значение, "Группа2.Значение");
	юТест.ПроверитьРавенство(2, Группа2.Длина, "Группа2.Длина");
	юТест.ПроверитьРавенство(2, Группа2.Индекс, "Группа2.Индекс");

	УбедитьсяЧтоОбходКоллекцииРаботаетВерно(КоллекцияГрупп, Группа0, "Группа");
КонецПроцедуры

Процедура УбедитьсяЧтоНашлиНужнуюСтроку(ИсходнаяСтрока, Совпадение, Представление)
	юТест.ПроверитьРавенство(ИсходнаяСтрока, Совпадение.Значение, Представление+".Значение");
	юТест.ПроверитьРавенство(СтрДлина(ИсходнаяСтрока), Совпадение.Длина, Представление+".Длина");
	юТест.ПроверитьРавенство(1, Совпадение.Индекс, Представление+".Индекс");
КонецПроцедуры

Процедура ТестДолжен_ПроверитьМетодРазделить() Экспорт
	ИсходнаяСтрока = "4 5";
	РегулярноеВыражение = Новый РегулярноеВыражение("\s");
	
	МассивСтрок = РегулярноеВыражение.Разделить(ИсходнаяСтрока);
	юТест.ПроверитьРавенство(Строка(Тип(МассивСтрок)), "Массив", "Тип(""МассивСтрок"") = ""Массив""");
	юТест.ПроверитьРавенство(2, МассивСтрок.Количество(), "МассивСтрок.Количество()");

	юТест.ПроверитьРавенство("4", МассивСтрок[0], "МассивСтрок[0]");
	юТест.ПроверитьРавенство("5", МассивСтрок[1], "МассивСтрок[1]");
КонецПроцедуры

Процедура УбедитьсяЧтоОбходКоллекцииРаботаетВерно(КоллекцияСовпадений, ЭлементДляСравнения, Представление)
	Для Каждого Элемент Из КоллекцияСовпадений Цикл
		Прервать;
	КонецЦикла;
	юТест.ПроверитьРавенство(ЭлементДляСравнения.Значение, Элемент.Значение, Представление+".Значение, "+ Представление + "_1.Значение");
	юТест.ПроверитьРавенство(ЭлементДляСравнения.Длина, Элемент.Длина, Представление+".Длина, " + Представление+"_1.Длина");
	юТест.ПроверитьРавенство(ЭлементДляСравнения.Индекс, Элемент.Индекс, Представление+".Индекс, " + Представление+"_1.Индекс");
КонецПроцедуры
