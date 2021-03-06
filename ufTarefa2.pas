unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TvarThread = class(TThread)
  private
    FpbBarraProg : TProgressBar;
    FTempoEspera : integer;
    procedure avancaProgresso;
  public
    constructor Create(pgProgresso : TProgressBar; tempoEspera : integer);
    procedure Execute; override;
  end;

type
  TfTarefa2 = class(TForm)
    btExecutar: TButton;
    lbThread1: TLabel;
    edTmpThread1: TEdit;
    lbThread2: TLabel;
    edTmpThread2: TEdit;
    lbProgrThread1: TLabel;
    lbProgrThread2: TLabel;
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    procedure btExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Thread1 :   TvarThread;
    Thread2 :   TvarThread;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

{ TProcInThread }
procedure TvarThread.avancaProgresso;
begin
   FpbBarraProg.StepBy(1);
end;

constructor TvarThread.Create(pgProgresso: TProgressBar;
  tempoEspera: integer);
begin
    FpbBarraProg := pgProgresso;
    FTempoEspera := tempoEspera;
    inherited Create(True);
end;

procedure TvarThread.Execute;
var
  i : integer;
begin
    if Self.Terminated then
      abort();
    Synchronize(avancaProgresso);
    Sleep(FTempoEspera);
end;

procedure TfTarefa2.btExecutarClick(Sender: TObject);
var i : integer;
begin
   if Trim(edTmpThread1.Text) = '' then
   begin
     ShowMessage('Deve ser informado o tempo da Thread 1!');
     edTmpThread1.SetFocus;
     Abort;
   end;

   if Trim(edTmpThread2.Text) = '' then
   begin
     ShowMessage('Deve ser informado o tempo da Thread 2!');
     edTmpThread2.SetFocus;
     Abort;
   end;

   pbThread1.Position := 0;
   pbThread2.Position := 0;

   Thread1 := TvarThread.Create(pbThread1, StrToInt(edTmpThread1.Text));
   Thread2 := TvarThread.Create(pbThread2, StrToInt(edTmpThread2.Text));

   Thread1.Start;
   Thread2.Start;
   for i := 0 to 99 do
   begin
      Thread1.Execute;
      Thread2.Execute;
   end;

   FreeAndNil(Thread1);
   FreeAndNil(Thread2);
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FreeAndNil(fTarefa2);
end;

end.
