unit Task_1;

interface
{ Подключение используемых модулей }
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, jpeg,
  Buttons, Grids, DBGrids;
{ Объявления типов }
type
  TLagrangeForm = class(TForm)
    DataChart: TChart;
    LineSeries: TLineSeries;
    PointSeries: TLineSeries;
    FormulaImg: TImage;
    XGradEdit: TLabeledEdit;
    CalcBtn: TBitBtn;
    DataGrid: TStringGrid;
    LagCompute: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure calculate();
    procedure CalcBtnClick(Sender: TObject);
  private
  { Private declarations }
  public
  { Public declarations }
  end;
  { Тип массива данных }
  Arrs = array of real;
var
  { Форма приложения }
  LagrangeForm: TLagrangeForm;
    test1 : Arrs;
    test2 : Arrs;
    { Массив изначальных данных }
    ys: array[1..6] of real = (0.17365, 0.34202, 0.5, 0.64279, 0.76604, 0.86603);

implementation

{$R *.dfm}

{ Вспомогательная функция рачёта коэффициента }
Function riLagr(xs:Arrs;n:byte; x:real):real;
var
    i:byte;
Begin
    Result:=1;
    For i:=0 to length(xs)-1 do
    begin
        if i<>n then 
            begin
                result:=result*(x-xs[i])/(xs[n]-xs[i]);
            end;
    end;
end;

{ Вспомогательная функция рачёта массива коэффициентов }
Function lagrY(xs,xy:Arrs; x:real):real;
var 
    i:byte;
Begin
    result:=0;
    for i:=0 to length(xs)-1 do
        result:=result+(xy[i]*riLagr(xs,i,x));
end;

{ Расчёт интерполяции }
procedure TLagrangeForm.calculate();
var
k:integer;
tochka:real;
pointX : real;
begin
{ Возьмем значение точки Х }
pointX := StrToFloat(XGradEdit.Text);
{ Очистим графики }
DataChart.Series[1].Clear;
DataChart.Series[0].Clear;

{ Заполнение данными }
for k:= 1 to 6 do begin
  test1[k-1] := StrToFloat(DataGrid.Cells[k, 0]);
  test2[k-1] := StrToFloat(DataGrid.Cells[k, 1]);
  DataChart.Series[1].AddXY(test1[k-1], test2[k-1]);
end;
{ Вычисление зн в точке }
tochka := lagrY(test1, test2, pointX);
DataChart.Series[0].AddXY(pointX, tochka);

{ Вывод формулы с подстановкой }
LagCompute.Caption := 'L5('+ FloatToStr(pointX) +') = ';
for k:= 1 to 6 do begin
    LagCompute.Caption := LagCompute.Caption + FloatToStr(test2[k-1]) + '*(';
    LagCompute.Caption := LagCompute.Caption + FloatToStr(riLagr(test1, k - 1, pointX)) +')';
    if k <> 6 then
      LagCompute.Caption := LagCompute.Caption + ' + ';
end;
LagCompute.Caption := LagCompute.Caption + ' = ' + FloatToStr(tochka);
end;

{ Заполненние изначальными данными }
procedure TLagrangeForm.FormCreate(Sender: TObject);
var
k:integer;
begin
setlength(test1, 6);
setlength(test2, 6);

for k:= 1 to 6 do begin
  test1[k-1] := k*10;
  test2[k-1] := ys[k];
  DataGrid.Cols[k].Add(FloatToStr(test1[k-1]));
  DataGrid.Cols[k].Add(FloatToStr(test2[k-1]));
end;

DataGrid.Cols[0].Add('Xi');
DataGrid.Cols[0].Add('Yi');
calculate();
end;

procedure TLagrangeForm.CalcBtnClick(Sender: TObject);
begin
calculate();
end;

end.
