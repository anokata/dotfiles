unit Task_4;

interface
{ Подключение используемых модулей }
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, jpeg, Math;
{ Объявления типов }
type
  TRombergForm = class(TForm)
    TitleLabel: TLabel;
    CalcBtn: TButton;
    FunctionLabel: TLabel;
    DataGrid: TStringGrid;
    FormulaImg: TImage;
    ConditionLabel: TLabel;
    InputBox: TGroupBox;
    LimitA: TEdit;
    LimitB: TEdit;
    LimitALabel: TLabel;
    LimitBLabel: TLabel;
    procedure CalcBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  { Форма приложения }
  RombergForm: TRombergForm;
  { Массив для расчётов }   
  R: array[1..10] of array[1..10] of real;
  a, b, e, h, s: real;
  m:byte;
implementation

{$R *.dfm}

{ Функция для интегрирования }
function fnf(x:real):real;
begin
result := roundto(sin(x), -2);
end;

{ Процедура расчёта }
procedure TRombergForm.CalcBtnClick(Sender: TObject);
var
i, j, k, last:byte;
begin
{ Ввод пределов интегрирования }
a:=StrToFloat(LimitA.Text);
b:=StrToFloat(LimitB.Text);
last:=0;
m:=10;
e:=0.00001;
h:=b-a;
R[1, 1] := 0.5 * h * (fnf(a) + fnf(b));
{ Основной цикл расчёта }
for i:=2 to m do begin
    s:=0;
    last := i;
    for k:=1 to Round(power(2, i-2)) do begin
        s:=s+fnf(a+h*(k-0.5))
    end;

    R[i,1]:=0.5*(R[i-1,1]+h*s);
    h:=0.5*h;

    for j:=2 to i do begin
    R[i,j]:= (Round(power(2, 2*(j-1)))*R[i,j-1] - R[i-1,j-1])/
             (Round(power(2, 2*(j-1)) - 1));
    end;
    if abs(R[i,i]-R[i-1,i-1]) < e then break;
    ConditionLabel.Caption:= 'Интеграл равен: ' + FloatToStr(RoundTo(R[i-1,i-1], -7));
end;
{ Вывод результата в таблицу }
for i:=1 to last-1 do begin
    for j:=1 to i do begin
    DataGrid.Cells[j-1,i-1] := FloatToStr(RoundTo(R[i,j], -5));
    end; end;

end;

end.
