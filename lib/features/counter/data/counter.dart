import 'package:crochet_app_redesign/features/project/data/crochet_project.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Counter {
  @Id()
  int id = 0;

  late String name;
  int value = 0;
  @Property(type: PropertyType.date)
  DateTime dateAdded = DateTime.now();
  int counterTypeId = CounterType.stitch.id;

  @Transient()
  set counterType(CounterType value) => counterTypeId = value.id;
  @Transient()
  CounterType get counterType => CounterType.values[counterTypeId];

  final linkedProject = ToOne<CrochetProject>();
}

enum CounterType {
  stitch('Stitch', 0),
  row('Row', 1),
  round('Round', 2);

  const CounterType(this.counterType, this.id);
  final String counterType;
  final int id;
}
