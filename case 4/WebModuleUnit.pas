unit WebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Web.HTTPProd;

type
  TWebModule1 = class(TWebModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSetTableProducer1: TDataSetTableProducer;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1AddTaskAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  FDQuery1.SQL.Text := 'SELECT * FROM Tasks';
  FDQuery1.Open;
  DataSetTableProducer1.Header.Add('<h1>Task List</h1>');
  DataSetTableProducer1.Footer.Add('<a href="/addtask">Add New Task</a>');
  Response.Content := DataSetTableProducer1.Content;
end;

procedure TWebModule1.WebModule1AddTaskAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if Request.Method = 'POST' then
  begin
    FDQuery1.SQL.Text := 'INSERT INTO Tasks (TaskName, TaskDescription, DueDate) VALUES (:TaskName, :TaskDescription, :DueDate)';
    FDQuery1.ParamByName('TaskName').AsString := Request.ContentFields.Values['TaskName'];
    FDQuery1.ParamByName('TaskDescription').AsString := Request.ContentFields.Values['TaskDescription'];
    FDQuery1.ParamByName('DueDate').AsDateTime := StrToDateTime(Request.ContentFields.Values['DueDate']);
    FDQuery1.ExecSQL;
    Response.Content := '<p>Task added successfully!</p><a href="/">Back to Task List</a>';
  end
  else
  begin
    Response.Content :=
      '<form method="post">' +
      'Task Name: <input type="text" name="TaskName"><br>' +
      'Task Description: <input type="text" name="TaskDescription"><br>' +
      'Due Date: <input type="datetime-local" name="DueDate"><br>' +
      '<input type="submit" value="Add Task">' +
      '</form>';
  end;
end;

end.