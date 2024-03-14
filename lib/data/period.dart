import 'package:hive/hive.dart';

part 'period.g.dart';

@HiveType(typeId: 1)
class Period {
  Period({
    required this.name,
    required this.start,
    required this.finished,
    required this.category,
    required this.goalOne,
    required this.goalTwo,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String start;

  @HiveField(2)
  String finished;

  @HiveField(3)
  String category;

  @HiveField(4)
  String goalOne;

  @HiveField(5)
  String goalTwo;
}
