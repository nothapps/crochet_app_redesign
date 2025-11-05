import 'package:crochet_app_redesign/features/project/data/crochet_project.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id()
  int id = 0;

  late String content;
  @Property(type: PropertyType.date)
  DateTime dateAdded = DateTime.now();

  final linkedProject = ToOne<CrochetProject>();
}
