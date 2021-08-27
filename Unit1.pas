unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.AppEvnts;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    V1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Timer1: TTimer;
    Button3: TButton;
    ApplicationEvents1: TApplicationEvents;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses dateutils;
{$R *.dfm}

procedure TForm1.ApplicationEvents1Minimize(Sender: TObject);
begin
  Hide;
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  DateTimePicker1.DateTime := Now;
  Timer1.Enabled := true;
  Button1.Enabled := false;
  Button2.Enabled := true;
  Self.WindowState := wsMinimized;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Button2.Enabled := false;
  Button1.Enabled := true;
  Timer1.Enabled := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  inizio, fine: TTime;
  totale: Integer;
  oraprest, prestazione: Currency;
begin
  inizio := DateTimePicker1.Time;
  fine := DateTimePicker2.Time;
  totale := dateutils.HoursBetween(inizio, fine);
  oraprest := StrToFloat(LabeledEdit1.Text);
  prestazione := oraprest * totale;
  Label2.Caption := FloatToStr(prestazione) + ' €';
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  ShowMessage
    ('Applicazione gratuita creata da MarijSoft.(c) 2013,Tutti i diritti riservati');
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if Application.MessageBox('Vuoi uscire dall''applicazione?',
    'Termina applicazione', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES
  then
  begin
    Application.Terminate;
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  DateTimePicker2.DateTime := Now;
end;

procedure TForm1.V1Click(Sender: TObject);
begin
  if Visible then
  begin
    Application.Minimize;
  end
  else
  begin
    Show;
    Application.Restore;
    Self.WindowState := wsNormal;
  end;
end;

end.
