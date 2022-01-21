{ Расчет коэффициентов Сумма X^n }
Function sumKoef (xs:Arrs; exp:byte):real;
var
    i:byte;
Begin
{ Инициализация результата }
result:=0;
{ последний элемент?}
for i:=0 to length(xs)-1 do begin
    { суммируем степень i-го коэффициента}
    result:=result+power(xs[i], exp);
    end;
end;
{
sum_start=>start: Расчет коэффициентов Сумма X^n 
sumkoef_op=>operation: Инициализация результата 
sumkoef_loop=>operation: Цикл
sumkoef_cond=>condition: последний элемент?
sumkoef_op2=>operation: суммируем степень i-го коэффициента
e=>end: Конец

sum_start->sumkoef_loop->sumkoef_cond->sumkoef_op2
sumkoef_cond(no)->sumkoef_loop
sumkoef_cond(yes)->e

}

{ Расчет коэффициентов Сумма(X^n)*Y }
Function sumKoefXY(xs:Arrs; ys:Arrs; exp:byte):real;
var
    i:byte;
Begin
{ Инициализация результата }
result:=0;
{ последний элемент?}
for i:=0 to length(xs)-1 do begin
    { суммируем произведение степени i-го коэффициента и значения функции}
    result:=result+power(xs[i], exp)*ys[i];
    end;
end;
{
s=>start: Расчет коэффициентов Сумма(X^n)*Y 
e=>end: Конец
sumkoefxy_op=>operation: Инициализация результата 
sumkoefxy_loop=>operation: Цикл
sumkoefxy_cond=>condition: последний элемент?
sumkoefxy_op2=>operation: суммируем произведение степени i-го коэффициента и значения функции

s->sumkoefxy_op->sumkoefxy_loop
sumkoefxy_loop->sumkoefxy_cond->sumkoefxy_op2
sumkoefxy_cond(no)->sumkoefxy_loop
sumkoefxy_cond(yes)->e
}

{ Предварительная очистка и заполнение данными }
procedure TKvadratForm.calculate();
var
k:integer;
begin
{ Очистка графиков }
DataChart.Series[0].Clear;
DataChart.Series[1].Clear;
DataChart.Series[2].Clear;
DataChart.Series[3].Clear;
DataChart.Series[4].Clear;
DataChart.Series[5].Clear;
for k:= 1 to 9 do begin
{ Заполненяем массива введёнными данными }
  test1[k-1] := StrToFloat(DataGrid.Cells[k, 0]);
  test2[k-1] := StrToFloat(DataGrid.Cells[k, 1]);
  DataChart.Series[0].AddXY(test1[k-1], test2[k-1]);

end;
end;
{ 
s=>start: Предварительная очистка и заполнение данными 
e=>end: Конец

pre_op1=>operation: Очистка графиков 
pre_loop=>operation: Цикл
pre_cond=>condition: последний элемент?
pre_op2=>operation: Заполненяем массива введёнными данными 

pre_op1->pre_loop->pre_cond
pre_cond(no)->pre_op2->pre_loop
pre_cond(yes)->
}


{ Решение системы уравнений }
procedure GaussM(a:matrix;n:word; var s:byte; var x:array of real);
var
  i, k, j: byte;
  m, t: real;
begin
  i:=1;
  s:=1;
  repeat
    j:=i+1;
    k:=i;
    m:=abs(a[i,i]);
    repeat
      if m<abs(a[j,i]) then begin
        m:=abs(a[j,i]);
        k:=j;
      end;
      j:=j+1
    until not(j<=n);

    if m<>0 then begin
      j:=i;
      repeat
        t:=a[i,j];
        a[i,j]:=a[k,j];
        a[k,j]:=t;
        j:=j+1
      until not(j<=n+1);
      k:=i+1;
      repeat
        t:=a[k,i]/a[i,i];
        a[k,i]:=0;
        j:=i+1;
        repeat
          a[k,j]:=a[k,j]-t*a[i,j];
          j:=j+1
        until not(j<=n+1);
        k:=k+1
      until not(k<=n);
    end
    else begin
      s:=0;
    end;
    i:=i+1
  until not((i<=n)and(s=1));

  if s=1 then begin
    i:=n;
    repeat
      x[i]:=a[i,n+1];
      j:=i+1;
      while j<=n do begin
        x[i]:=x[i]-a[i,j]*x[j];
        j:=j+1;
      end;
      x[i]:=x[i]/a[i,i];
      i:=i-1
    until not(i>=1);
  end;
end;

{ заполнение массивов тест1,тест2 }
procedure TKvadratForm.FormCreate(Sender: TObject);
var
k:integer;
begin
{ Начало }
{ Инициализация массивов }
setlength(test1, 9);
setlength(test2, 9);

for k:= 1 to 9 do begin
  test1[k-1] := xs1[k];
  test2[k-1] := ys[k];
  DataGrid.Cols[k].Add(FloatToStr(test1[k-1]));
  DataGrid.Cols[k].Add(FloatToStr(test2[k-1]));
end;

DataGrid.Cols[0].Add('Xi');
DataGrid.Cols[0].Add('Yi');
calculate();
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

{ Расчет и отображение графиков }
procedure TKvadratForm.CalcBtnClick(Sender: TObject);
begin
ComputeField.Caption :='';
calculate();

if PolyCheck1.Checked=true then
begin
    calculatePolyN(1);
    ComputeField.Caption := 'Y(1) = c(1) + c(2)*X = ' + floatToStr(RoundTo(b[1], -4)) + ' + ' +
                        floatToStr(RoundTo(b[2], -4)) + ' * X;';
end;

if PolyCheck2.Checked=true then
begin
    calculatePolyN(2);
    ComputeField.Caption := ComputeField.Caption + #10+#13 + 'Y(2) = c(1) + c(2)*X + c(3)*X^2 = ' +
                        floatToStr(RoundTo(b[1], -4)) + ' + ' +
                        floatToStr(RoundTo(b[2], -4)) + ' * X + ' +
                        floatToStr(RoundTo(b[3], -4)) + ' * X^2;';
end;

if PolyCheck3.Checked=true then
begin
    calculatePolyN(3);
    ComputeField.Caption := ComputeField.Caption + #10+#13 + 'Y(3) = c(1) + c(2)*X + c(3)*X^2 + c(4)*X^3 = ' +
                        floatToStr(RoundTo(b[1], -4)) + ' + ' +
                        floatToStr(RoundTo(b[2], -4)) + ' * X + ' +
                        floatToStr(RoundTo(b[3], -4)) + ' * X^2 + ' +
                        floatToStr(RoundTo(b[4], -4)) + ' * X^3;';
end;

if PolyCheck4.Checked=true then
begin
    calculatePolyN(4);
    ComputeField.Caption := ComputeField.Caption + #10+#13 + 'Y(4) = c(1) + c(2)*X + c(3)*X^2 + ' +
                        'c(4)*X^3 + c(5)*X^4= ' +
                        floatToStr(RoundTo(b[1], -7)) + ' + ' +
                        floatToStr(RoundTo(b[2], -7)) + ' * X + ' +
                        floatToStr(RoundTo(b[3], -5)) + ' * X^2 + ' +
                        floatToStr(RoundTo(b[4], -4)) + ' * X^3 + ' +
                        floatToStr(RoundTo(b[5], -4)) + ' * X^4;'
end;

if PolyCheck5.Checked=true then
begin
    calculatePolyN(5);
    ComputeField.Caption := ComputeField.Caption + #10+#13 + 'Y(5) = c(1) + c(2)*X + c(3)*X^2 + ' +
                        'c(4)*X^3 + c(5)*X^4 + c(6)*X^5 = ' +
                        floatToStr(RoundTo(b[1], -10)) + ' + ' +
                        floatToStr(RoundTo(b[2], -7)) + ' * X + ' +
                        floatToStr(RoundTo(b[3], -5)) + ' * X^2 + ' +
                        floatToStr(RoundTo(b[4], -4)) + ' * X^3 + ' +
                        floatToStr(RoundTo(b[5], -4)) + ' * X^4 + ' +
                        floatToStr(RoundTo(b[6], -4)) + ' * X^5;'
end;
end;


{ Возведение в степень n }
function power(x:real; exp:byte):real;
var n:byte;
begin
result:=1;
for n:=1 to exp do result:=result*x;
end;

{ Расчет коэффициентов }
procedure KoefGaussN(n: byte);
var
i,k,z:byte;
begin
z := n * 2;
n := n + 1;
for i := 1 to n do begin
    for k := 1 to n do begin
    ArrayKoef[i,k]:= sumKoef(test1, z - k - i + 2);
    end;
ArrayKoef[i,n+1]:= sumKoefXY(test1,test2, n - i);
end;

ArrayKoef[n,n]:= length(test1);
ArrayKoef[n,n+1]:= sumKoef(test2, 1);

GaussM(ArrayKoef,n,s,b);
end;


{ Расчет Y-ков и вывод графиков }
procedure calculatePolyN(n:byte);
var
k,i:integer;
xs : Arrs;
begin
{ Создание массивов результата }
setlength(arrayYgraf, H+1);
setlength(xs, H+2);
{ Последний шаг?  }
    for k:= 0 to H+1 do begin
    { расчёт абсциссы }
    xs[k] := -100+k*200/H;
    end;
{  }
KoefGaussN(n);
{ Последний шаг?  }
    for k:= 0 to H do begin
    {  }
    arrayYgraf[k] := 0;
    {  }
        for i:= 1 to n+1 do begin
        { рассчёт ординаты }
        arrayYgraf[k] := arrayYgraf[k] + b[i]*(power(xs[k], n + 1 - i))
        end;
    { Добавление точки на график }
    KvadratForm.DataChart.Series[n].AddXY(xs[k], arrayYgraf[k]);
    end;
end;

end.



