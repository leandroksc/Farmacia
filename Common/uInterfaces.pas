unit uInterfaces;

interface

uses
  Generics.Collections;

type
  IController<T> = interface
  ['{0C2244E8-E369-4D84-96ED-22978CF2394F}']
    procedure Salvar(const AObject: T);
    procedure Excluir(const AObject: T);
    function Buscar(const AFilter: string): TList<T>;
  end;

  IValidable = interface
  ['{A867A5C0-AC44-49B7-B1AC-EC9D8F2C0EF1}']
    procedure Validar;
  end;

implementation

end.
