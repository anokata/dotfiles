unit Task_3;

interface
{ Подключение используемых модулей }
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, jpeg, ExtCtrls, Math, TeEngine,
  Series, TeeProcs, Chart;

{ Объявления типов }
type
  { Класс формы }
  TCalcForm = class(TForm)
    DataTable: TStringGrid;
    CalcBtn: TBitBtn;
    TitleLabel: TLabel;
    FormulaImg: TImage;
    DataChart: TChart;
    DataSeries: TLineSeries;
    DerivationGroup: TRadioGroup;
    DerivationThreeRadio: TRadioButton;
    DerivationFiveRadio: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure CalcBtnClick(Sender: TObject);
    procedure calculate();
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    { Типы массивов данных }
    Arrs = array of real;
    Arrs12 =array[1..12] of real;

var
  { Форма приложения }
  CalcForm: TCalcForm;
  { Массив изначальных данных времени }
  timeDefaultArray: array[1..12] of real = (0.00, 5.01, 10.09, 13.98, 16.62, 18.01,
                                    22.53, 25.33, 28.03, 30.42, 32.06, 33.62);
  { Массив изначальных данных отклонений }
  biasDefaultArray: array[1..12] of real = (0.00, 0.18, 1.05, 1.73, 2.35, 2.96,
                                    3.76, 4.48, 5.28, 6.12, 7.09, 8.00);
  { Массивы для расчётов }                                  
  derivativetArray: arrs12;
  timeDataArray: arrs;
  biasDataArray: arrs;

implementation

{$R *.dfm}

{ Заполнение начальными данными }
procedure TCalcForm.FormCreate(Sender: TObject);
var
k:integer;

begin
for k:= 1 to 12 do begin
  DataTable.Rows[k].Add(FloatToStr(timeDefaultArray[k]));
  DataTable.Rows[k].Add(FloatToStr(biasDefaultArray[k]));
end;
{ Настройка заголовков столбцов }
DataTable.Cols[0].Add('Время, мс');
DataTable.Cols[1].Add('Смещение, мм');
DataTable.Cols[2].Add('Скорость, м/с');
DataTable.Cols[3].Add('Вычисления:');
end;


{ заполнение массивов числами из таблицы }
procedure TCalcForm.calculate();
var
k:integer;
begin
setlength(timeDataArray, 12);
setlength(biasDataArray, 12);
for k:= 0 to 11 do begin
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

for i:=0 to m do
begin
  n:=i-1;
  if i=0 then n:=0;
  if i=m then n:=m-2;
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

{ расчет по пятым разностям }
function derivationFive(x,y:arrs):arrs12;
var
m, i, n:integer;
{ Разности }
D1, D2, D3, D4, D5:real;
begin
m:=12-1;

for i:=0 to m do
begin
  n:=i-1;
  if i<3 then n:=0;
  if i>m-3 then n:=m-4;
  D1:=(4*(Power(x[i], 3))- 3*(Power(x[i], 2))*(x[n+1]+x[n+2]+x[n+3]+x[n+4])+
    2*x[i]*(x[n+1]*x[n+2]+x[n+1]*x[n+3]+x[n+1]*x[n+4]+x[n+2]*x[n+3]+x[n+2]*x[n+4]+x[n+3]*x[n+4])-
    (x[n+1]*x[n+2]*x[n+3])-(x[n+1]*x[n+2]*x[n+4])-(x[n+1]*x[n+3]*x[n+4])-(x[n+2]*x[n+3]*x[n+4]))
                    /((x[n]-x[n+1])*(x[n]-x[n+2])*(x[n]-x[n+3])*(x[n]-x[n+4]));


  D2:=(4*(Power(x[i], 3))- 3*(Power(x[i], 2))*(x[n]+x[n+2]+x[n+3]+x[n+4])+
    2*x[i]*(x[n]*x[n+2]+x[n]*x[n+3]+x[n]*x[n+4]+x[n+2]*x[n+3]+x[n+2]*x[n+4]+x[n+3]*x[n+4])-
    (x[n]*x[n+2]*x[n+3])-(x[n]*x[n+2]*x[n+4])-(x[n]*x[n+3]*x[n+4])-(x[n+2]*x[n+3]*x[n+4]))
                    /((x[n+1]-x[n])*(x[n+1]-x[n+2])*(x[n+1]-x[n+3])*(x[n+1]-x[n+4]));


  D3:=(4*(Power(x[i], 3))- 3*(Power(x[i], 2))*(x[n]+x[n+1]+x[n+3]+x[n+4])+
    2*x[i]*(x[n]*x[n+1]+x[n]*x[n+3]+x[n]*x[n+4]+x[n+1]*x[n+3]+x[n+1]*x[n+4]+x[n+3]*x[n+4])-
    (x[n]*x[n+1]*x[n+3])-(x[n]*x[n+1]*x[n+4])-(x[n]*x[n+3]*x[n+4])-(x[n+1]*x[n+3]*x[n+4]))
                    /((x[n+2]-x[n])*(x[n+2]-x[n+1])*(x[n+2]-x[n+3])*(x[n+2]-x[n+4]));


  D4:=(4*(Power(x[i], 3))- 3*(Power(x[i], 2))*(x[n]+x[n+1]+x[n+2]+x[n+4])+
    2*x[i]*(x[n]*x[n+1]+x[n]*x[n+2]+x[n]*x[n+4]+x[n+1]*x[n+2]+x[n+1]*x[n+4]+x[n+2]*x[n+4])-
    (x[n]*x[n+1]*x[n+2])-(x[n]*x[n+1]*x[n+4])-(x[n]*x[n+2]*x[n+4])-(x[n+1]*x[n+2]*x[n+4]))
                    /((x[n+3]-x[n])*(x[n+3]-x[n+1])*(x[n+3]-x[n+2])*(x[n+3]-x[n+4]));


  D5:=(4*(Power(x[i], 3))- 3*(Power(x[i], 2))*(x[n]+x[n+1]+x[n+2]+x[n+3])+
    2*x[i]*(x[n]*x[n+1]+x[n]*x[n+2]+x[n]*x[n+3]+x[n+1]*x[n+2]+x[n+1]*x[n+3]+x[n+2]*x[n+3])-
    (x[n]*x[n+1]*x[n+2])-(x[n]*x[n+1]*x[n+3])-(x[n]*x[n+2]*x[n+3])-(x[n+1]*x[n+2]*x[n+3]))
                    /((x[n+4]-x[n])*(x[n+4]-x[n+1])*(x[n+4]-x[n+2])*(x[n+4]-x[n+3]));

  result[i+1]:=D1*y[n] + D2*y[n+1] + D3*y[n+2] + D4*y[n+3] + D5*y[n+4];
  CalcForm.DataTable.Cells[3, i+1] := 'P'+#39+'(x) = '+FloatToStr(RoundTo(D1, -3))+'*'+ FloatToStr(y[n])+' + ('+
                                     FloatToStr(RoundTo(D2, -3))+'*'+ FloatToStr(y[n+1])+') + '+
                                     FloatToStr(RoundTo(D3, -3))+'*'+ FloatToStr(y[n+2])+' + ('+
                                     FloatToStr(RoundTo(D4, -3))+'*'+ FloatToStr(y[n+3])+') + '+
                                     FloatToStr(RoundTo(D5, -3))+'*'+ FloatToStr(y[n+4])+' = '+
                                     FloatToStr(RoundTo(result[i+1], -3));
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
DataChart.Series[0].Clear;
for k:= 0 to 12 do begin
  DataTable.Cells[2, k+1] := (FloatToStr(derivativetArray[k+1]));
  DataChart.Series[0].AddXY(timeDataArray[k], derivativetArray[k+1]);
end;
end;

end.
