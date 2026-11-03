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
  UI.FieldGroup: {
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

// tabel voor favorite game
annotate GameService.FavoriteGame with @(
  UI.LineItem: [
    { Value: to_game.Name,      Label: 'Game' },
    { Value: to_game.Genre,     Label: 'Genre' },
    { Value: to_game.Platform,  Label: 'Platform' },
    { Value: to_game.Publisher, Label: 'Publisher' }
  ]
);

