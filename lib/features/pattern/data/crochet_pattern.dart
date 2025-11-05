import 'dart:typed_data';
import 'package:crochet_app_redesign/features/project/data/crochet_project.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CrochetPattern {
  @Id()
  int id = 0;

  late String name;
  @Property(type: PropertyType.date)
  DateTime dateAdded = DateTime.now();
  String? webLink;
  String? ytLink;
  String? pdfPath;
  Uint8List? image;

  final linkedProjects = ToMany<CrochetProject>();
}
