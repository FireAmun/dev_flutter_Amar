import 'entity.dart';

class User extends LibraryEntity {
  final String name;

  User({required String id, required this.name}) : super(id);
}
