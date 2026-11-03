using {sap.igdbfe.cap as my} from '../db/schema';

service GameService {
  entity Game @readonly as projection on my.Game;
  entity Student        as projection on my.Student;
  entity FavoriteGame   as projection on my.FavoriteGame;
  annotate GameService.Student with @odata.draft.enabled;
}
