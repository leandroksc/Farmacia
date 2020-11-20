unit uBaseController;

interface

uses
  Aurelius.Engine.ObjectManager, uServerContext;

type
  TBaseController = class(TInterfacedObject)
  protected
    FServerContext: TServerContext;
  public
    constructor Create;
  end;

implementation

{ TBaseController }

constructor TBaseController.Create;
begin
  FServerContext := TServerContext.GetInstance;
end;

end.
