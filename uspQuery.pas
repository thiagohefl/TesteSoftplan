unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    { Private declarations }
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
  protected
    { Protected declarations }
  public
    { Public declarations }
    function GeraSQL  : string;
  published
    { Published declarations }
    property spCondicoes: TStringList read FspCondicoes write FspCondicoes;
    property spColunas: TStringList read FspColunas write FspColunas;
    property spTabelas: TStringList read FspTabelas write FspTabelas;
  end;

implementation

{ TspQuery }

function TspQuery.GeraSQL : string;
var SQL : string;
begin
   if Trim(spColunas.Text) = '' then
      result := 'SELECT *'
   else
      result := 'SELECT ' + spColunas.Text;
   result := result + 'FROM ' + spTabelas.Text;
   if Trim(spCondicoes.Text) <> '' then
      result := result + 'WHERE ' + spCondicoes.Text;
end;

end.
