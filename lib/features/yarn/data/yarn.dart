import 'dart:typed_data';
import 'package:crochet_app_redesign/features/project/data/crochet_project.dart';
import 'package:objectbox/objectbox.dart';

// part 'yarn.g.dart';

@Entity()
class Yarn {
  @Id()
  int id = 0;

  late String name;
  @Property(type: PropertyType.date)
  DateTime dateAdded = DateTime.now();
  List<String>? fiberContent;
  List<int>? fiberPercentage;
  double? yarnWeight;
  int? yarnLength;
  List<double>? recommendedHooks;
  late List<int> yarnColors;
  Uint8List? image;
  int weightCategoryId = WeightCategory.unknown.id;

  @Transient()
  set weightCategory(WeightCategory value) => weightCategoryId = value.id;
  @Transient()
  WeightCategory get weightCategory => WeightCategory.values[weightCategoryId];

  final linkedProjects = ToMany<CrochetProject>();
}

enum WeightCategory {
  lace('Lace', 0),
  fingering('Fingering', 1),
  sock('Sock', 2),
  sport('Sport', 3),
  dk('DK', 4),
  worsted('Worsted', 5),
  aran('Aran', 6),
  bulky('Bulky', 7),
  superBulky('Super Bulky', 8),
  jumbo('Jumbo', 9),
  unknown('Unknown', 10);

  const WeightCategory(this.weightCategory, this.id);
  final String weightCategory;
  final int id;
}
