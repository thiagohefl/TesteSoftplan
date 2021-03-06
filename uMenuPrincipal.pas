unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ufTarefa1, ufTarefa2, ufTarefa3;

type
  TfMenuPrincipal = class(TForm)
    mnPrincipal: TMainMenu;
    mnTarefas: TMenuItem;
    mnTarefa1: TMenuItem;
    mnTarefa2: TMenuItem;
    mnTarefa3: TMenuItem;
    procedure mnTarefa3Click(Sender: TObject);
    procedure mnTarefa1Click(Sender: TObject);
    procedure mnTarefa2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuPrincipal: TfMenuPrincipal;

implementation

{$R *.dfm}

procedure TfMenuPrincipal.mnTarefa1Click(Sender: TObject);
begin
   fTarefa1 := TfTarefa1.Create(self);
   fTarefa1.Show;
end;

procedure TfMenuPrincipal.mnTarefa2Click(Sender: TObject);
begin
   fTarefa2 := TfTarefa2.Create(self);
   fTarefa2.Show;
end;

procedure TfMenuPrincipal.mnTarefa3Click(Sender: TObject);
begin
   fTarefa3 := TfTarefa3.Create(self);
   fTarefa3.Show;
end;

end.
