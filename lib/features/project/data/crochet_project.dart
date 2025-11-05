import 'dart:typed_data';
import 'package:crochet_app_redesign/features/counter/data/counter.dart';
import 'package:crochet_app_redesign/features/note/data/note.dart';
import 'package:crochet_app_redesign/features/pattern/data/crochet_pattern.dart';
import 'package:crochet_app_redesign/features/yarn/data/yarn.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CrochetProject {
  @Id()
  int id = 0;

  late String name;
  @Property(type: PropertyType.date)
  DateTime dateAdded = DateTime.now();
  List<double>? hooks;
  final linkedPattern = ToOne<CrochetPattern>();
  final linkedYarn = ToMany<Yarn>();
  @Backlink('linkedProject')
  final linkedCounters = ToMany<Counter>();
  @Backlink('linkedProject')
  final linkedNotes = ToMany<Note>();
  @Property(type: PropertyType.byteVector)
  Uint8List? image;
  String icon = 'favorite';
  int progressId = Progress.notStarted.id;

  @Transient()
  set progress(Progress value) => progressId = value.id;
  @Transient()
  Progress get progress => Progress.values[progressId];
}

enum Progress {
  notStarted('Not started', 0),
  inProgress('In progress', 1),
  finished('Finished', 2);

  const Progress(this.progress, this.id);
  final String progress;
  final int id;
}
