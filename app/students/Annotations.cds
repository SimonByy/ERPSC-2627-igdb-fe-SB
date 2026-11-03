using GameService from '../../srv/game-service';

// lijst en detail pagina: 
annotate GameService.Student with @(
  UI.HeaderInfo: {
    TypeName      : 'Student',
    TypeNamePlural: 'Studenten',
    Title         : { Value: First_name },
    Description   : { Value: Last_name }
  },
  UI.SelectionFields: [ First_name, Last_name ],
  UI.LineItem: [
    { Value: First_name },
    { Value: Last_name }
  ],
  UI.FieldGroup #Algemeen: {
    Data: [
      { Value: First_name },
      { Value: Last_name }
    ]
  },
  UI.Facets: [
    { $Type: 'UI.ReferenceFacet', ID: 'Algemeen',   Label: 'Algemene gegevens', Target: '@UI.FieldGroup#Algemeen' },
    { $Type: 'UI.ReferenceFacet', ID: 'Favorieten', Label: 'Favoriete games',   Target: 'to_favos/@UI.LineItem' }
  ]
);
annotate GameService.Student with {
  Student_ID @UI.Hidden;
  First_name @title: 'Voornaam';
  Last_name  @title: 'Achternaam';
};

// ---------- Favoriete games: tabel op de detailpagina ----------
annotate GameService.FavoriteGame with @(
  UI.LineItem: [
    { Value: Game_ID,           Label: 'Game' },
    { Value: to_game.Genre,     Label: 'Genre' },
    { Value: to_game.Platform,  Label: 'Platform' },
    { Value: to_game.Publisher, Label: 'Publisher' }
  ]
);

annotate GameService.FavoriteGame with {
  Student_ID @UI.Hidden;
  Game_ID @title: 'Game'
          @Common.Text: to_game.Name
          @Common.TextArrangement: #TextOnly
          @Common.ValueList: {
            CollectionPath: 'Game',
            Parameters: [
              { $Type: 'Common.ValueListParameterInOut',       LocalDataProperty: Game_ID, ValueListProperty: 'Game_ID' },
              { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Name' },
              { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Genre' },
              { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'Platform' }
            ]
          };
};

