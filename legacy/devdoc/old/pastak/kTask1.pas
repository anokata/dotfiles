
*******
для отображения http://flowchart.js.org/ в принципе там рендерится в svg, его можно вручную из разметки страницы вытащить, ну или PrtScr
синтаксис таков:
сначала описываем блоки так
имя блока (придумываем) => тип блока (один из operation, start, end, condition) : текст
например
blockA =>operation: если A не А
blocks =>start: начало
потом описываются связи так:
имя блока -> имя другого блока
например
blocks -> blockA
***************
{ Вспомогательная функция рачёта коэффициента R_i }
Function riLagr(xs:Arrs;n:byte; x:real):real;
var
    i:byte;
Begin
{ Инициализация результата }
    Result:=1;
{ i <> length(xs)-1  последний элемент?}
    For i:=0 to length(xs)-1 do
    begin
{ i <> n }
        if i<>n then 
{ вычисление коэффициента }
            begin
                result:=result*(x-xs[i])/(xs[n]-xs[i]);
            end;
    end;
end;
Диграмма {
ri_op1=>operation: Инициализация результата
ri_loop=>operation: Цикл
ri_cond=>condition: последний элемент?
ri_op2=>operation: вычисление коэффициента

ri_op1->ri_loop->ri_cond
ri_cond(no)->ri_op2
ri_cond(yes)->
}

{ Вспомогательная функция рачёта  по массиву значения функции }
Function lagrY(xs,xy:Arrs; x:real):real;
var 
    i:byte;
Begin
{ Инициализация результата }

{ последний элемент?}
    for i:=0 to length(xs)-1 do
        { вычисление значения функции точке по массиву }
        result:=result+(xy[i]*riLagr(xs,i,x));
end;
{
lagr_op1=>operation: Инициализация результата
lagr_cond=>condition: последний элемент?
lagr_op2=>operation: вычисление значения функции точке по массиву 
lagr_loop=>operation: Цикл
ri_op1=>operation: Инициализация результата
ri_loop=>operation: Цикл
ri_cond=>condition: последний элемент?
ri_op2=>operation: вычисление коэффициента

lagr_op1->lagr_loop->lagr_cond
lagr_cond(no)->lagr_loop
lagr_cond(yes)->ri_op1

ri_op1->ri_loop->ri_cond
ri_cond(no)->ri_op2
ri_cond(yes)->
}

{ Расчёт интерполяции }
procedure TLagrangeForm.calculate();
var
k:integer;
tochka:real;
pointX : real;
begin
    { Возьмем значение точки Х }
{ Ввод значения Х }
pointX := StrToFloat(XGradEdit.Text);
{ очистка графика }
DataChart.Series[1].Clear;
DataChart.Series[0].Clear;

{ Заполнение введёнными данными }
{ все элементы? }
for k:= 1 to 6 do begin
    { записать k-ый элемент в массивы и график }
  test1[k-1] := StrToFloat(DataGrid.Cells[k, 0]);
  test2[k-1] := StrToFloat(DataGrid.Cells[k, 1]);
  DataChart.Series[1].AddXY(test1[k-1], test2[k-1]);
end;
{ Вычисление значения в точке }
tochka := lagrY(test1, test2, pointX);
DataChart.Series[0].AddXY(pointX, tochka);

{ Вывод формулы с подстановкой значений }
LagCompute.Caption := 'L5('+ FloatToStr(pointX) +') = ';
for k:= 1 to 6 do begin
    LagCompute.Caption := LagCompute.Caption + FloatToStr(test2[k-1]) + '*(';
    LagCompute.Caption := LagCompute.Caption + FloatToStr(riLagr(test1, k - 1, pointX)) +')';
    if k <> 6 then
      LagCompute.Caption := LagCompute.Caption + ' + ';
end;
LagCompute.Caption := LagCompute.Caption + ' = ' + FloatToStr(tochka);
{ Конец }
end;
{
st=>start: Начало
e=>end: Конец
bg_op1=>operation: Инициализация массивов
bg_cond=>condition: все элементы?
bg_op2=>operation: Заполнение таблицы начальными данными 
bg_loop=>operation: Цикл

tl_op1=>operation: Ввод значения Х 
tl_op2=>operation: очистка графика 
tl_loop=>operation: Заполнение введёнными данными 
tl_cond=>condition: все элементы? 
tl_op3=>operation: записать k-ый элемент в массивы и график 
lagr_op1=>operation: Инициализация результата
lagr_cond=>condition: последний элемент?
lagr_op2=>operation: вычисление значения функции точке по массиву 
lagr_loop=>operation: Цикл
ri_op1=>operation: Инициализация результата
ri_loop=>operation: Цикл
ri_cond=>condition: последний элемент?
ri_op2=>operation: вычисление коэффициента

st->bg_op1->bg_loop->bg_cond
bg_cond(no)->bg_loop
bg_cond(yes)->tl_op1

tl_op1->tl_op2->tl_loop->tl_cond
tl_cond(no)->tl_loop
tl_cond(yes)->lagr_op1

lagr_op1->lagr_loop->lagr_cond
lagr_cond(no)->lagr_loop
lagr_cond(yes)->ri_op1

ri_op1->ri_loop->ri_cond
ri_cond(no)->ri_op2
ri_cond(yes)->e

}

{ Заполненние изначальными данными }
procedure TLagrangeForm.FormCreate(Sender: TObject);
var
k:integer;
begin
{ Начало }
{ Инициализация массивов }
setlength(test1, 6);
setlength(test2, 6);

{ Инициализация массивов }
for k:= 1 to 6 do begin
  test1[k-1] := k*10;
  test2[k-1] := ys[k];
{ Заполнение таблицы начальными данными }
  DataGrid.Cols[k].Add(FloatToStr(test1[k-1]));
  DataGrid.Cols[k].Add(FloatToStr(test2[k-1]));
end;
DataGrid.Cols[0].Add('Xi');
DataGrid.Cols[0].Add('Yi');
end;
{ 
st=>start: Начало
bg_op1=>operation: Инициализация массивов
bg_cond=>condition: все элементы?
bg_op2=>operation: Заполнение таблицы начальными данными 
bg_loop=>operation: Цикл

st->bg_op1->bg_loop->bg_cond
bg_cond(no)->bg_loop
bg_cond(yes)->

}


