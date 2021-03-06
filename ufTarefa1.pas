unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery, Vcl.ComCtrls, Vcl.DBCtrls;

type
  TfTarefa1 = class(TForm)
    pnSuperior: TPanel;
    pnRodape: TPanel;
    lbColunas: TLabel;
    memColunas: TMemo;
    lbTabelas: TLabel;
    memTabelas: TMemo;
    lbCondicoes: TLabel;
    btnGeraSQL: TButton;
    memSQLGerado: TMemo;
    spQuery: TspQuery;
    lbSQLGerado: TLabel;
    memCondicoes: TMemo;
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
var convertTab, convertCol, convertCond  : TstringList;
begin
   if memTabelas.Lines.Count > 1 then
   begin
      ShowMessage('Apenas uma tabela deve ser informada!');
      memTabelas.SetFocus;
      Abort;
   end;


   convertTab := TStringList.Create;
   convertCol := TStringList.Create;
   convertCond := TStringList.Create;

   convertTab.AddStrings(memTabelas.Lines);
   spQuery.spTabelas:=convertTab;

   convertCol.AddStrings(memColunas.Lines);
   spQuery.spColunas := convertCol;

   convertCond.AddStrings(memCondicoes.Lines);
   spQuery.spCondicoes := convertCond;

   memSQLGerado.Clear;
   memSQLGerado.Lines.Add(spQuery.GeraSQL);
   memSQLGerado.Refresh;

   FreeAndNil(convertTab);
   FreeAndNil(convertCol);
   FreeAndNil(convertCond);
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(fTarefa1);
end;

end.
