# Исходный код, использовавшийся для моделирования

В файле model.m находится код, используемый для численного решения системы методом Эйлера.
Все коэффициенты изменяются внутри кода, в блоке с комментарием "коэффициенты". За шаг h метода Эйлера отвечает переменная h (над данным комментарием)

В файле analysis.m находся код, используемый для численной проверки устойчивости.
Данный код осуществляет полный перебор коэффициентов системы в заданном диапазоне, подставляя их в систему и выводя значения коэффициентов,
дающих устойчивые решения с соблюдением пропорции и выполняющейся целью
Начальные значения находятся перед каждым вложенным циклом, конечные - внутри условий цикла, шаг обхода задается переменной delta, погрешность пропорции - пемеренной eps.
