import 'package:hive/hive.dart';
part 'notes_model.g.dart';

// @HiveType(typeId: 0)
@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveType(typeId: 1)
  String description;

  NotesModel({required this.title, required this.description});
}

//! flutter packages pub run build_runner build