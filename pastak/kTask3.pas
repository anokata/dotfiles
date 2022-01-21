{ Заполнение начальными данными }
procedure TCalcForm.FormCreate(Sender: TObject);
var
k:integer;

begin
{ Начало }
{ Инициализация массивов }
{ все элементы? }
for k:= 1 to 12 do begin
{ Заполнение таблицы начальными данными }
  DataTable.Rows[k].Add(FloatToStr(timeDefaultArray[k]));
  DataTable.Rows[k].Add(FloatToStr(biasDefaultArray[k]));
end;
{ Настройка заголовков столбцов }
DataTable.Cols[0].Add('Время, мс');
DataTable.Cols[1].Add('Смещение, мм');
DataTable.Cols[2].Add('Скорость, м/с');
DataTable.Cols[3].Add('Вычисления:');
end;
{ 
st=>start: Начало
bg_op1=>operation: Инициализация массивов
bg_cond=>condition: все элементы?
bg_op2=>operation: Заполнение таблицы начальными данными 
bg_loop=>operation: Цикл
bg_op3=>operation: Настройка заголовков столбцов 

st->bg_op1->bg_loop->bg_cond
bg_cond(no)->bg_loop
bg_cond(yes)->bg_op3
bg_op3->
}


{ заполнение массивов числами из таблицы }
procedure TCalcForm.calculate();
var
k:integer;
begin
{ создание массивов для результата }
setlength(timeDataArray, 12);
setlength(biasDataArray, 12);
{ все элементы? }
for k:= 0 to 11 do begin
{ Заполнение массива введёнными данными }
  timeDataArray[k]:= StrToFloat(DataTable.Cells[0, k+1]);
  biasDataArray[k]:= StrToFloat(DataTable.Cells[1, k+1]);
end;
end;

{ расчет по третьим разностям }
function derivationThree(x,y:arrs):arrs12;
var
m, i, n:integer;
{ Разности }
D1, D2, D3:real;
begin
m:=12-1;

{ последний элемент массива? }
for i:=0 to m do
begin
  n:=i-1;
  if i=0 then n:=0;
  if i=m then n:=m-2;
  { расчёт разностей
    запись в результирующий массив
    добавление формулы в таблицу }
  D1:=(2*x[i]-x[n+1]-x[n+2])/((x[n]-x[n+1])*(x[n]-x[n+2]));
  D2:=(2*x[i]-x[n]-x[n+2])/((x[n+1]-x[n])*(x[n+1]-x[n+2]));
  D3:=(2*x[i]-x[n]-x[n+1])/((x[n+2]-x[n])*(x[n+2]-x[n+1]));
  result[i+1]:=D1*y[n]+D2*y[n+1]+D3*y[n+2];
  CalcForm.DataTable.Cells[3, i+1] := 'P'+#39+'(x) = '+FloatToStr(RoundTo(D1, -3))+'*'+ FloatToStr(y[n])+' + ('+
                                     FloatToStr(RoundTo(D2, -3))+'*'+ FloatToStr(y[n+1])+') + '+
                                     FloatToStr(RoundTo(D3, -3))+'*'+ FloatToStr(y[n+2])+' = '+
                                     FloatToStr(RoundTo(result[i+1], -6));
end;
end;

procedure TCalcForm.CalcBtnClick(Sender: TObject);
var k:integer;
begin
{ Заполнение изначальными значениями }
calculate();
{ Расчёт разностей }
if (DerivationThreeRadio.Checked = true) then
derivativetArray:=derivationThree(timeDataArray,biasDataArray)
else
derivativetArray:=derivationFive(timeDataArray,biasDataArray);

{ Вывод результата в таблицу }
{ Очистка графика }
DataChart.Series[0].Clear;
{ последний элемент массива? }
for k:= 0 to 12 do begin
    { Вывод результатов расчётов элемента в таблицу и график }
  DataTable.Cells[2, k+1] := (FloatToStr(derivativetArray[k+1]));
  DataChart.Series[0].AddXY(timeDataArray[k], derivativetArray[k+1]);
end;
{ end}
end;
{
st=>start: Начало
bg_op1=>operation: Инициализация массивов
bg_cond=>condition: все элементы?
bg_op2=>operation: Заполнение таблицы начальными данными 
bg_loop=>operation: Цикл
bg_op3=>operation: Настройка заголовков столбцов 

inp_op=>operation: создание массивов для результата 
inp_loop=>operation: Цикл
inp_cond=>condition: все элементы? 
inp_op2=>operation: Заполнение массива введёнными данными 

ra_op1=>operation: Цикл
ra_cond=>condition: последний элемент массива? 
ra_op2=>operation: расчёт разностей
    запись в результирующий массив
    добавление формулы в таблицу 

calc_op1=>operation: Очистка графика
calc_loop=>operation: Цикл
calc_cond=>condition: последний элемент массива?
calc_op2=>operation: Вывод результатов расчётов элемента в таблицу и график
e=>end: Конец

st->bg_op1->bg_loop->bg_cond
bg_cond(no)->bg_loop
bg_cond(yes)->bg_op3
bg_op3->inp_op

inp_op->inp_loop->inp_cond
inp_cond(no)->inp_op2->inp_loop
inp_cond(yes)->ra_op1

ra_op1->ra_cond
ra_cond(no)->ra_op2->ra_op1
ra_cond(yes)->calc_op1

calc_op1->calc_loop->calc_cond
calc_cond(no)->calc_op2->calc_loop
calc_cond(yes)->e
}

end.
